if (A_IsAdmin != true) {
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}


Menu, Tray, Icon , Icon.ico, 1, 1
Menu, Tray, Add, Hotkeys, ShowGui

Global Bunny:=!Bunny
Global Attack:=!Attack
Global Pick:=!Pick
Global RapidFire:=!RapidFire
Global Walk:=!Walk
Global Freeze:=!Freeze

SetTimer, PauseLoop

~$`::
Suspend, permit
if (A_IsSuspended = "0")
{
     SoundBeep 2000, 50
}
Else
{
     SoundBeep 1000, 50
}
Suspend, Toggle

PauseLoop() {
    Suspend
    loop {
        WinWaitActive, ahk_exe GenshinImpact.exe
        Suspend, Off
        WinWaitNotActive, ahk_exe GenshinImpact.exe
        Suspend, On
    }
}
return

~Numpad1::
Numpad1:=!Numpad1
  If Numpad1
  	SoundBeep 1200, 50
  If !Numpad1 
	SoundBeep 2000, 50
  If (Bunny) {
    	AutoBunny:=!AutoBunny	
  }
return

~Numpad2::
Numpad2:=!Numpad2
  If Numpad2
  	SoundBeep 1200, 50
  If !Numpad2
  	SoundBeep 2000, 50
  If (Attack) {
	AutoAttack:=!AutoAttack
  }
return

~Numpad3::
Numpad3:=!Numpad3
  If Numpad3
  	SoundBeep 1200, 50
  If !Numpad3
  	SoundBeep 2000, 50
  If (Pick) {
	SpamF:=!SpamF
  }
return

~Numpad4::
Numpad4:=!Numpad4
  If Numpad4
  	SoundBeep 1200, 50
  If !Numpad4
  	SoundBeep 2000, 50
  If (Walk) {
	SpamWalk:=!SpamWalk
  }
return

~Numpad5::
Numpad5:=!Numpad5
  If Numpad5
  	SoundBeep 1200, 50
  If !Numpad5
  	SoundBeep 2000, 50
  If (Freeze) {
	SnapTrick:=!SnapTrick
  }
return

~Numpad6::
Numpad6:=!Numpad6
  If Numpad6
  	SoundBeep 1200, 50
  If !Numpad6
  	SoundBeep 2000, 50
  If (RapidFire) {
	SpamAim:=!SpamAim
  }
return

~$Space::
	If (AutoBunny)
	{
	    While GetKeyState("Space", "P"){
		Send {Space down}{Space up}
		Sleep 0
	    }
	}
return

~$LButton::
	If (AutoAttack)
	{
	    While GetKeyState("LButton", "P"){
		Send {LButton down}{LButton up}
		Sleep 0
	    }
	}
return

$RButton::
	If (SpamAim)
	{
	    SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
	    While GetKeyState("RButton", "P"){
		DoubleR()
		Click down
		Sleep 1
		Click up
		DoubleR()
	    }
	    return
	}
	DoubleR(){
	   Send {r down}
	   Sleep 20
	   Send {r up}
	   Sleep 35
	}
return

~$Up::
	If (SpamWalk)
	{
	    While GetKeyState("Up", "P"){
		Send {w down}{w up}
		Sleep 250
	    }
	}
return

~$Left::
	If (SpamWalk)
	{
	    While GetKeyState("Left", "P"){
		Send {a down}{a up}
		Sleep 250
	    }
	}
return

~$Down::
	If (SpamWalk)
	{
	    While GetKeyState("Down", "P"){
		Send {s down}{s up}
		Sleep 250
	    }
	}
return

~$Right::
	If (SpamWalk)
	{
	    While GetKeyState("Right", "P"){
		Send {d down}{d up}
		Sleep 250
	    }
	}
return

~$t::
	If (SnapTrick)
	{
	    While GetKeyState("t", "P"){
		Send {z down}{z up}{f down}{f up}
		Sleep 0
	    }
	}
return
~$f::
	If (SpamF)
	{
	    While GetKeyState("f", "P"){
		Send {f down}{f up}
		Sleep 0
	    }
	}
return

~$p::
{
	While GetKeyState("p", "P"){
		Send {LButton down}{LButton up}
		Sleep 0
	}
}
return

ShowGui:
Gui, New
Gui, Add, Text,, *     Numpad1     *     |     Auto Bunny     |
Gui, Add, Text,, *     Numpad2     *     |     Auto Attack     |
Gui, Add, Text,, *     Numpad3     *     |     Fast Pick     |
Gui, Add, Text,, *     Numpad4     *     |     Spam Walk     |
Gui, Add, Text,, *     Numpad5     *     |     Freeze Time     |
Gui, Add, Text,, *     Numpad6     *     |     Rapid Fire     |
Gui, Add, Button, X15 Y165 W80, Hide
Gui, Add, Button, X120 Y165 W80, Close
Gui, -SysMenu
Gui, +AlwaysOnTop
Gui, Show, X0 Y0 W220 H200, Genshin Impact - Macro Hotkeys -
return

ButtonHide:
Gui, Hide
return

ButtonClose:
ExitApp
return

#MaxHotkeysPerInterval 100
