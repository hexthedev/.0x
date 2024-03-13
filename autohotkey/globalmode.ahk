#SingleInstance Force
SetWorkingDir A_ScriptDir

; Global remaps
CapsLock::Ctrl
RAlt::Esc
PrintScreen::CapsLock

; Tooltip
PrintMode()

; Start win-vind
Run("win-vind", ,"Hide")

; ChildPID
global childPID := 0

^Space::{
    global childPID
    if(ProcessExist(childPID) = 0){
        Run("navmode.ahk", , , &childPID)
    }
}

!^+Esc::{ 
    if(ProcessExist(childPID) == 0){
        ExitApp
    }
}

; Pri
!m::PrintMode()
PrintMode()
{
    ToolTip "Global Mode"
    SetTimer () => ToolTip(), -1500
}