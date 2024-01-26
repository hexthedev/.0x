; Hotkey Environment
#SingleInstance Force
SetWorkingDir A_ScriptDir
shell := ComObject("WScript.Shell")
#UseHook
USERPROFILE := "C:\Users\james.mccafferty"

; Tooltip
Print("Jkeys Started")

; Start win-vind
Run("win-vind", ,"Hide")

; Modes
debugMode := 0
mode := "nav"

; Keys
^a::RouteKeys("^a")
!a::RouteKeys("!a")

^b::RouteKeys("^a")

^c::RouteKeys("^c")
#!c::RouteKeys("#!c")
#!+c::RouteKeys("#!+c")
#+c::RouteKeys("#+c")

^d::RouteKeys("^d")
!d::RouteKeys("!d")
!+d::RouteKeys("!+d")
#+d::RouteKeys("#+d")

^e::RouteKeys("^e")
!e::RouteKeys("!e")
!+e::RouteKeys("!+e")
#!e::RouteKeys("#!e")
#!+e::RouteKeys("#!+e")
#+e::RouteKeys("#+e")



f::RouteKeys("f")
^f::RouteKeys("^f")
!+f::RouteKeys("!+f")
;#!f::RouteKeys("#!f")
#+f::RouteKeys("#+f")

^g::RouteKeys("^g")

^h::RouteKeys("^h")

^i::RouteKeys("^i")
#!i::RouteKeys("#!i")

^j::RouteKeys("^j")

^k::RouteKeys("^k") 
!k::RouteKeys("!k") 

^l::RouteKeys("^l")
#+l::RouteKeys("#+l")

^m::RouteKeys("^m")
+m::RouteKeys("+m")
!m::RouteKeys("!m")
!+m::RouteKeys("!+m")
#+m::RouteKeys("#+m")

^n::RouteKeys("^n")
!+n::RouteKeys("!+n")
!n::RouteKeys("!n")

^o::RouteKeys("^o")
#!o::RouteKeys("#!o")
#+o::RouteKeys("#+o")


p::RouteKeys("p")
^p::RouteKeys("^p")
#!p::RouteKeys("#!p")
#+p::RouteKeys("#+p")

^q::RouteKeys("^q")
!q::RouteKeys("!q")

^r::RouteKeys("^r")
;#!r::RouteKeys("#!r") ;; OFF LIMITS CAUSE OF XBOX

^s::RouteKeys("^s")
#!s::RouteKeys("#!s")
#+s::RouteKeys("#+s")

^t::RouteKeys("^t")
!t::RouteKeys("!t")

^u::RouteKeys("^u")
#!u::RouteKeys("#!u")
#+u::RouteKeys("#+u")

^v::RouteKeys("^v")
!v::RouteKeys("!v")
#!v::RouteKeys("#!v")
#+v::RouteKeys("#+v")


^w::RouteKeys("^w")
!w::RouteKeys("!w")
#!w::RouteKeys("#!w")
#+w::RouteKeys("#+w")


^x::RouteKeys("^x")

^y::RouteKeys("^y")

^z::RouteKeys("^z")

; Routing
RouteKeys(keys)
{
    global USERPROFILE

    ; Debug Mode
    if(keys = "!+d")
    {
         global debugMode := !debugMode
         Print("Debug Mode: " debugMode)
         return
    }
    
    ; Usage Modes
    if(keys = "!+n")
    {
        SetMode("nav")
        return
    }
    
    if(keys = "!+e")
    {
        SetMode("edit")
        return
    }

    ; EasyClick Mode
    if(keys = "!+f")
    {
        shell.Run("win-vind --func to_gui_normal", 0, true)       
        return
    }

    ; Routing
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
    }

    HandleNonProcessedKey(keys)
}

ControlsEdit(keys)
{
    Switch keys
    {
        Default:
            HandleNonProcessedKey(keys)
    }
}

; Nav Controls
ControlsNav(keys)
{
    intention := "none"
    
    Switch keys
    {
;       Case "^f": intention := "search"
        
        Case "^m": intention := "tab_next"
        Case "^n": intention := "tab_last"
        
        Case "^t": intention := "taskbar_focus"
        
        ; global nav controls
        Case "!m": intention := "desktops_show"
        Case "!w": intention := "desktop_focus"
        Case "!k": intention := "click_right"
        Case "!q": intention := "window_quit"
        Case "!a": intention := "window_switch"
    }
    
    Switch intention
    {
        Case "desktops_show":
            Send("#{Tab}")
            return
        Case "click_right":
            Send("+{F10}")
            return
        Case "desktop_focus":
            Send("#d")
            return
        Case "window_quit":
            Send("!{F4}")
            return
        Case "window_switch":
            Send("!{Tab}")
            return
    }

    if(IsIDE()){
        ControlNavIDE(intention, keys)
        return
    }
    
    if(IsBrowser()){
        ControlNavBrowser(intention, keys)
        return
    }

    ; Default mode is desktop
    ControlNavDesktop(intention, keys)
}

ControlNavDesktop(intention, keys)
{
    if(intention = "none")
    {
        HandleNonProcessedNavKeys(keys)
    }
    else
    {
        Switch(intention)
        {
            Case "search": Send("#s")
            Case "tab_last": Send("#^{Left}")
            Case "tab_next": Send("#^{Right}")
            Case "taskbar_focus": Send("#t")
        }
    }
}

ControlNavIDE(intention, keys)
{
    if(intention = "none")
    {
        HandleNonProcessedNavKeys(keys)
    }
    else
    {
        Switch(intention)
        {
            Case "search": Send("^+a")
            Case "tab_last": Send("#^{Left}")
            Case "tab_next": Send("#^{Right}")
            Case "taskbar_focus": Send("#t")
        }
    }

}

ControlNavBrowser(intention, keys)
{
    if(intention = "none")
    {
        HandleNonProcessedNavKeys(keys)
    }
    else
    {
        Switch(intention)
        {
            Case "search": Send("!d")
            Case "tab_last": Send("#^{Left}")
            Case "tab_next": Send("#^{Right}")
            Case "taskbar_focus": Send("#t")
        }
    }
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

HandleNonProcessedNavKeys(keys)
{
    global USERPROFILE
    pid := -1

    Sleep(100)
    ; Global window navigation
    Switch keys
    {
        Case "#+c": RunWait('chrome.exe  --profile-directory="Profile 1"' , , , &pid)
        Case "#+m": Run('chrome.exe  --profile-directory="Profile 2"', , , &pid)
        Case "#+e": Send("#e") pid := 1
        Case "#+f": RunExplorerContextual('"' USERPROFILE '\AppData\Local\JetBrains\Toolbox\apps\Rider\ch-0\231.8109.212\bin\rider64.exe"', &pid)
        Case "#+o": Run('"' USERPROFILE '\AppData\Local\Fork\Fork.exe', , ,&pid)
        Case "#+p": RunExplorerContextual('"' USERPROFILE '\AppData\Local\JetBrains\Toolbox\apps\PyCharm-P\ch-0\231.8109.197\bin\pycharm64.exe"', &pid)
        Case "#+l": Run("C:\Program Files\Slack\slack.exe", , , &pid)
        Case "#+u": Run('"C:\Program Files\Unity Hub\Unity Hub.exe"', , , &pid)
        Case "#+v": RunExplorerContextual('"' USERPROFILE '\AppData\Local\Programs\Microsoft VS Code\Code.exe"', &pid)
        Case "#+w": RunExplorerContextual('"' USERPROFILE '\AppData\Local\JetBrains\Toolbox\apps\WebStorm\ch-0\231.8109.174\bin\webstorm64.exe"', &pid)
    }

    if(pid = -1)
        HandleNonProcessedKey(keys)
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
    return WinExist("A") & (WinGetProcessName("A") = "chrome.exe")
}

IsIDE()
{
    return WinExist("A") & (WinGetProcessName("A") = "rider64.exe")
}

Print(str)
{
    ToolTip str
    SetTimer () => ToolTip(), -1500
}

RunExplorerContextual(command, pid)
{
    path := GetActiveExplorerPath()

    if(path == "none")
        Run(command, , "Max", &pid)
    else
        Run(command ' ' GetActiveExplorerPath(), , "Max" , &pid)
}

GetActiveExplorerPath()
{
	explorerHwnd := WinActive("ahk_class CabinetWClass")
	if (explorerHwnd)
	{
		for window in ComObject("Shell.Application").Windows
		{
			if (window.hwnd==explorerHwnd)
			{
				return window.Document.Folder.Self.Path
			}
		}
	}

    return "none"
}