#SingleInstance Force
#MaxThreadsPerHotkey 2
#MaxThreads 2
SetWorkingDir A_ScriptDir
ProcessSetPriority("High")

PrintMode()

^h::Left
^j::Up
^k::Down 
^l::Right

^t::#t
^s::#s
+m::#Tab
^d::Send("{Shift down}{F10 down}{Shift up}{F10 up}")
^a::!Tab
^q::Send("{Alt down}{F4 down}{Alt up}{F4 up}")
Space::Enter
^e::#e
^v::#Up

^n::#^Left
^m::#^Right
 
shell := ComObject("WScript.Shell")

^f::{
     ; Create a new instance of WScript.Shell
     output := shell.Run("win-vind --func easy_click_left", 0, true)    
}

!m::PrintMode()
PrintMode()
{
     ToolTip "Nav mode"
     SetTimer () => ToolTip(), -1500
}

!Esc::ExitApp