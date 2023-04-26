; Hotkey Environment
#SingleInstance Force
SetWorkingDir A_ScriptDir
shell := ComObject("WScript.Shell")
#UseHook

; Global remaps
CapsLock::Ctrl
RAlt::Esc
PrintScreen::CapsLock

; Tooltip
Print("Jkeys Started")

; Start win-vind
Run("win-vind", ,"Hide")

; Modes
debugMode := 0
mode := "nav"

; Keys
CapsLock & a::RouteKeys("^a")

CapsLock & b::RouteKeys("^a")

CapsLock & c::RouteKeys("^c")

CapsLock & d::RouteKeys("^d")
!d::RouteKeys("!d")

CapsLock & e::RouteKeys("^e")
!e::RouteKeys("!e")

f::RouteKeys("f")
CapsLock & f::RouteKeys("^f")

CapsLock & g::RouteKeys("^g")

CapsLock & h::RouteKeys("^h")

CapsLock & i::RouteKeys("^i")

CapsLock & j::RouteKeys("^j")

CapsLock & k::RouteKeys("^k") 

CapsLock & l::RouteKeys("^l")

CapsLock & m::RouteKeys("^m")
+m::RouteKeys("+m")

CapsLock & n::RouteKeys("^n")
!n::RouteKeys("!n")

CapsLock & o::RouteKeys("^o")

p::RouteKeys("p")
CapsLock & p::RouteKeys("^p")

CapsLock & q::RouteKeys("^q")

CapsLock & r::RouteKeys("^r")

CapsLock & s::RouteKeys("^s")

CapsLock & t::RouteKeys("^t")

CapsLock & u::RouteKeys("^u")

CapsLock & v::RouteKeys("^v")
!v::RouteKeys("!v")

CapsLock & w::RouteKeys("^w")

CapsLock & x::RouteKeys("^x")

CapsLock & y::RouteKeys("^y")

CapsLock & z::RouteKeys("^z")


RouteKeys(keys)
{
    ; Modes
    if(keys = "!d")
    {
         global debugMode := !debugMode
         Print("Debug Mode: " debugMode)
         return
    }
    
    if(keys = "!n")
    {
        SetMode("nav")
        return
    }
    
    if(keys = "!e")
    {
        SetMode("edit")
        return
    }

    if(keys = "!v")
    {
        shell.Run("win-vind --func to_gui_normal", 0, true)       
        return
    }

    if(debugMode)
    {
        Print("Debug" keys)
        ControlsDebug(keys)
        return
    }
    
    Switch mode
    {
        Case "nav":
            ControlsNav(keys)
            return
        Case "edit":
            ControlsEdit(keys)
            return
        Default:
            HandleNonProcessedKey(keys)
    }
}

ControlsEdit(keys)
{
    Switch keys
    {
        Default:
            HandleNonProcessedKey(keys)
    }
}

ControlsNav(keys)
{
    intention := "none"
    
    Switch keys
    {
        Case "^f":
            intention := "search"
    }
    
    if(intention != "none")
    {
        if(IsIDE()){
            ControlNavIDE(intention)
            return
        }
        
        if(IsBrowser()){
            ControlNavBrowser(intention)
            return
        }
    
        ; Default mode is desktop
        ControlNavDesktop(intention)
        return
    }

    HandleNonProcessedKey(keys)
}

ControlNavDesktop(intention)
{
    Switch(intention)
    {
        Case "search":
            Send("#s")
            return
    }
    return
}

ControlNavIDE(intention)
{
    Switch(intention)
    {
        Case "search":
            Send("^+a")
            return
    }
    return
}

ControlNavBrowser(intention)
{
    Switch(intention)
    {
        Case "search":
            Send("!d")
            return
    }
    return
}


ControlsDebug(keys)
{
    Switch keys
    {
        Case "^t":
            Print("Window: " WinGetTitle("A"))
        Case "^p":
            Print("Process Name: " WinGetProcessName("A"))
        Default:
            HandleNonProcessedKey(keys)
    }
}

SetMode(modeStr)
{
    global mode
    mode := modeStr
    Print("Mode " mode)
}

HandleNonProcessedKey(keys)
{
    if(debugMode)
    {
        Print("None Processed " keys)
    }
    
    Send(keys)
}

IsBrowser()
{
    return WinGetProcessName("A") = "chrome.exe"
}

IsIDE()
{
    return WinGetProcessName("A") = "rider64.exe"
}

Print(str)
{
    ToolTip str
    SetTimer () => ToolTip(), -1500
}
