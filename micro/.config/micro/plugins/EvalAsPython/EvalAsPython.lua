VERSION = "1.0.0"

function EvalAsPython()
    local v = CurView()
    local c = v.Cursor

    if not c:HasSelection() then
        -- Select the entire line that the user is on.
        -- Note that we're not using c:SelectLine(), since this also selects the trailing newline
        c:Start()
        c:SetSelectionStart(Loc(c.Loc.X, c.Loc.Y))
        c:End()
        c:SetSelectionEnd(Loc(c.Loc.X, c.Loc.Y))
    end

    local expr = c:GetSelection()

    -- run the text as python code
    code = [[
from random import *
from math import *
print(%s, end='')]]
    Output, Error = ExecCommand("python3", "-c", string.format(code, expr))

    -- if we had an error, don't continue
    if Error ~= nil then
        messenger:Message(Output)
        return
    end

    -- the command ran fine, let's substitute the selection for the output
    v.Buf:Replace(Loc(c.CurSelection[1].X, c.CurSelection[1].Y),
                  Loc(c.CurSelection[2].X, c.CurSelection[2].Y),
                  Output)
end

MakeCommand("EvalAsPython", "EvalAsPython.EvalAsPython")
BindKey("Alt-Enter", "EvalAsPython.EvalAsPython")