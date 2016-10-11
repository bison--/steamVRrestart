#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <Constants.au3>
#include <WinAPI.au3>


restartSteamVr()

Func restartSteamVr()
   ; Wait 1 seconds for the Notepad window to appear.
   Local $hWnd = WinWait("Steam", "", 1)

   ; Retrieve the PID of Steam using the window handle returned by WinWait.
   Local $iPID = WinGetProcess($hWnd)

   WinActivate($hWnd)
   Sleep(1000)
   WinSetState($hWnd, "", @SW_MAXIMIZE)
   ;1795x20
   MouseClick($MOUSE_CLICK_LEFT, 1795, 20, 1)
   Sleep(20000)
   MouseClick($MOUSE_CLICK_LEFT, 1795, 20, 1)

 EndFunc