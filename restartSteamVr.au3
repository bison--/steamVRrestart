#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <Constants.au3>
#include <WinAPI.au3>

Global $debug = False
$keepRunning = True

While $keepRunning
   $clickedOn = MsgBox($MB_YESNO, "restart steam VR", "click yes to restart, no to end this", 0)
   if $clickedOn == $IDYES Then
	  restartSteamVr()
   ElseIf $clickedOn == $IDNO Then
	  $keepRunning = False
   EndIf
WEnd

;MsgBox($MB_SYSTEMMODAL, "", "END")


Func restartSteamVr()
   ; Wait 1 seconds for the Notepad window to appear.
   Local $hWnd = WinWait("Steam", "", 1)

   ; Retrieve the PID of Steam using the window handle returned by WinWait.
   Local $iPID = WinGetProcess($hWnd)

   WinActivate($hWnd)
   Sleep(1000)
   WinSetState($hWnd, "", @SW_MAXIMIZE)
   $aClientSize = WinGetClientSize($hWnd)
   ;1920
   ;1795x20
   $vrIconPositionX =  $aClientSize[0] - 125
   $vrIconPositionY = 20

   if $debug Then
	  MsgBox($MB_SYSTEMMODAL, "", $aClientSize[0] & "x" & $aClientSize[1] & "|" & $vrIconPositionX & "x" & $vrIconPositionY)
	  MouseMove($vrIconPositionX, $vrIconPositionY, 10)
   Else
	  MouseClick($MOUSE_CLICK_LEFT, $vrIconPositionX, $vrIconPositionY, 1)
	  Sleep(15000)
	  MouseClick($MOUSE_CLICK_LEFT, $vrIconPositionX, $vrIconPositionY, 1)
   EndIf
 EndFunc