SetWorkingDir, %A_ScriptDir%\Counters
global Map := []

Loop, Files, *.txt
{
    Key := A_Index
    Value := A_LoopFileName
    Map[Key] := Value
    Hotkey, %Key% & Up, CounterKeyUp
    Hotkey, %Key% & Down, CounterKeyDown
}
Exit

UpdateCounter(key, increase)
{
    Index := SubStr(key, 1, 1)
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