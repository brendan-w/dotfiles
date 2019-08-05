VERSION = "1.0.0"

local search_view = nil

-- Sets the all lines > 0 to the given string
function SetBufferTail(v, str)
    local b = v.Buf
    local c = v.Cursor
    local c_loc = c.Loc

    messenger:Message(c_loc.X, c_loc.Y)

    --messenger:Message(b.NumLines)
    if b.NumLines > 1 then
        --b:deleteToEnd(Loc(0, 1)) -- col, row  -- TODO: why doesn't this work???
        b:remove(Loc(0, 1), Loc(b:End().X, b:End().Y)) -- col, row
    end

    -- TODO: why is this necessary???
    if b.NumLines == 1 then
        b:insert(Loc(b:End().X, b:End().Y), "\n")
    end

    b:insert(Loc(b:End().X, b:End().Y), str)

    --c:GotoLoc(Loc(c_loc.X, c_loc.Y))  -- TODO: why doesn't this work???
    c:GotoLoc(Loc(string.len(b:Line(0)), 0))
end


function FileSearchOpen()
    local b = NewBuffer("", "")
    local v = CurView()
    v:HSplit(b)
    v = CurView() -- get a handle to the new view we just opened
    search_view = v
    --v:AddTab(true)
end

function FileSearchClose()
    if search_view ~= CurView() then
        return
    end    

    -- force the buffer into a non-dirty state, to prevent the Y/N closure prompt
    -- see cmd/micro/buffer.go for details
    search_view.Buf.Settings["fastdirty"] = true
    search_view.Buf.IsModified = false

    search_view:Quit(false)
    search_view = nil
end

function FileSearchGo(v)
    local line = v.Cursor.Loc.Y

    -- if the user's cursor is still at the top search line, take this to mean
    -- that the first result is acceptable
    if line == 0 then
        line = 1
    end

    -- TODO: Not operable, because the SetTailBuffer() function always adds a newline.
    --       Using a Workaround for empty lines below.
    if v.Buf.NumLines < 2 then
        messenger:Message("No match found")
        return
    end

    local filename = v.Buf:Line(line)

    if string.len(filename) == 0 then
        messenger:Message("No match found")
        return
    end

    messenger:Message("Selected", filename)

    FileSearchClose()
end

-- Generic update function for when the search query changes
function Update(v)
    -- if this is a keystroke not in the search window, do nothing
    if search_view ~= v then
        return
    end

    local b = v.Buf
    local q = b:Line(0)

    if string.len(q) < 2 then
        SetBufferTail(v, "<type more>")
        return
    end

    Output, Error = ExecCommand("find", "./", "-type", "f", "-ipath", string.format("*%s*", q))

    if Error ~= nil then
        messenger:Message(Output)
        return
    end

    SetBufferTail(v, Output)

    --messenger:Message(v.Buf:Line(0))
end


--
-- Event Callbacks
--

function onRune(r, v)
    Update(v)
    return true
end

function preBackspace(v)
    Update(v)
    return true
end

function preInsertNewline(v)
    FileSearchGo(v)
    return true
end

MakeCommand("FileSearchOpen", "FileSearch.FileSearchOpen")
MakeCommand("FileSearchGo", "FileSearch.FileSearchGo")
MakeCommand("FileSearchClose", "FileSearch.FileSearchClose")
