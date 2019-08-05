VERSION = "1.0.0"

function SelectNextLine()
    local v = CurView()
    local c = v.Cursor

    if c:HasSelection() then
        -- move the end of the selection down by another line
        c:Down()
        c:SetSelectionEnd(Loc(c.Loc.x, c.Loc.y))
    else
        -- select the current line
        c:Start()
        c:SetSelectionStart(Loc(c.Loc.x, c.Loc.y))
        c:Down()
        c:SetSelectionEnd(Loc(c.Loc.x, c.Loc.y))
    end
end

MakeCommand("SelectNextLine", "SelectNextLine.SelectNextLine")
BindKey("Ctrl-L", "SelectNextLine.SelectNextLine")