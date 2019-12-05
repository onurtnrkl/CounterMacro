SetWorkingDir, %A_ScriptDir%\Counters
global Map := []

Loop, Files, *.txt
{
    Key := A_Index
    Value := A_LoopFileName
    Map[Key] := Value
    Hotkey, Up & %Key%, CounterKeyUp
    Hotkey, Down & %Key%, CounterKeyDown
}
Exit

UpdateCounter(key, increase)
{
    Index := SubStr(key, -1)
    File := A_WorkingDir . "\" . Map[Index]
    FileRead, Counter, %File%

    if increase
    {
        Counter++
    }
    else
    {
        Counter--
    }

    FileDelete, %File%
    FileAppend, %Counter%, %File%
    MsgBox, %Counter%
}

CounterKeyUp:
    UpdateCounter(A_ThisHotkey, True)
    Return
CounterKeyDown:
    UpdateCounter(A_ThisHotkey, False)
    Return