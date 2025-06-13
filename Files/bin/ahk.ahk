#NoTrayIcon
#SingleInstance force
#installKeybdHook
SendMode Input
SetTitleMatchMode, 2
;===================================>windows
#x::  ;================================>minimize_app
	WinGet, ActiveWindow, ID, A
	if (!WinActive("ahk_class Shell_TrayWnd") && !WinActive("ahk_class DV2ControlHost")
	&& !WinActive("ahk_class Windows.UI.Core.CoreWindow") && !WinActive("ahk_class NotifyIconOverflowWindow")
	&& !WinActive("ahk_class TaskListThumbnailWnd") && !WinActive("ahk_class #32768")
	&& !WinActive("ahk_class Button"))
{
	WinMinimize, % "ahk_id " ActiveWindow
}
return
#c::  ;================================>close_app
	WinGet, ActiveWindow, ID, A
	if (!WinActive("ahk_class Progman") && !WinActive("ahk_class Shell_TrayWnd")
	&& !WinActive("ahk_class Button"))
{
	WinClose, % "ahk_id " ActiveWindow
}
return
~LWin:: ;==============================>dis_win
	Send {Blind}{vk07}
return
~LWin & Tab:: ;==========================>dis_win+tab
	Send {Blind}{vk07}
return
^Tab:: ;============================>show_desktop
	WinMinimizeAll
return
#1::  ;================================>audio_next
	Send {Media_Next}
return
#2::  ;================================>audio_prev
	Send {Media_Prev}
return
;===================================>run_windows
#t::  ;================================>run_cmd
	Run, "cmd.exe"
	WinWait, ahk_class ConsoleWindowClass
	WinActivate, ahk_class ConsoleWindowClass
return
#p::  ;================================>restart_explorer
	Run, "cmd.exe" "/k taskkill /f /im explorer.exe & cd "%localappdata%\Microsoft\Windows\Explorer" & del "iconcache*" & del "thumbcache*" & start explorer.exe & exit /b"
return
#a::  ;================================>run_taskmgr
{
	Process, Exist, Taskmgr.exe
	if (ErrorLevel) {
		WinGet, winState, MinMax, ahk_exe Taskmgr.exe
		if (winState = 0 || winState = 1) {
			WinMinimize, ahk_exe Taskmgr.exe
		} else {
			WinActivate, ahk_exe Taskmgr.exe
		}
	} else {
		Run, Taskmgr.exe
		WinWait, ahk_exe Taskmgr.exe
		WinActivate, ahk_exe Taskmgr.exe
	}
}
return
#f::  ;================================>run_search
	Run, "%windir%\Extras\Search\everything.exe"
	WinWait, ahk_class EVERYTHING
	WinActivate, ahk_class EVERYTHING
return
;===================================>run_apps
#q::  ;================================>run_firefox
{
	Process, Exist, firefox.exe
	if (ErrorLevel) {
		WinGet, winState, MinMax, ahk_exe firefox.exe
		if (winState = 0 || winState = 1) {
			WinMinimize, ahk_exe firefox.exe
		} else {
			WinActivate, ahk_exe firefox.exe
		}
	} else {
		Run, firefox.exe
		WinWait, ahk_exe firefox.exe
		WinActivate, ahk_exe firefox.exe
	}
}
return
#w::  ;================================>run_freetube
{
	Process, Exist, FreeTube.exe
	if (ErrorLevel) {
		WinGet, winState, MinMax, ahk_exe FreeTube.exe
		if (winState = 0 || winState = 1) {
			WinMinimize, ahk_exe FreeTube.exe
		} else {
			WinActivate, ahk_exe FreeTube.exe
		}
	} else {
		Run, %userprofile%\AppData\Local\Programs\FreeTube\FreeTube.exe
		WinWait, ahk_exe FreeTube.exe
		WinActivate, ahk_exe FreeTube.exe
	}
}
return
#d::  ;================================>run_yandexmusic
{
	Process, Exist, YandexMusic.exe
	if (ErrorLevel) {
		WinGet, winState, MinMax, ahk_exe YandexMusic.exe
		if (winState = 0 || winState = 1) {
			WinMinimize, ahk_exe YandexMusic.exe
		} else {
			WinActivate, ahk_exe YandexMusic.exe
		}
	} else {
		Run, C:\Program Files\YandexMusicPatcher\YandexMusic\YandexMusic.exe
		WinWait, ahk_exe YandexMusic.exe
		WinActivate, ahk_exe YandexMusic.exe
		Sleep 5000
		ControlSend, , {k},
		WinMinimize, ahk_exe YandexMusic.exe
	}
}
return
#IfWinActive, Firefox ;======================>tab_newtab
	Tab::
	Send, ^t
return