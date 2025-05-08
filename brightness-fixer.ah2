#SingleInstance Force

GroupAdd, programs, ahk_exe Code.exe
GroupAdd, programs, ahk_exe idea64.exe


;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
; ;put this line near the top of your script: 
; FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% 
; ;=============================================

global brightness := 0
ChangeBrightness(brightness)
Sleep, 100
return

ChangeBrightness(value, timeout = 1 )
{
    if ( value >= 100 )
        {
            value := 100
        }
        else if ( value <= 0 )
            {
                value := 1
            }

            global brightness := value

            For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
                property.WmiSetBrightness( timeout, value )
}

; Same as Vim Up
^k::
    ChangeBrightness(brightness += 5)
    return
; Same as Vim Down
^j:: 
    ChangeBrightness(brightness -= 5)
    return



#IfWinNotActive ahk_group programs
^b::
ChangeBrightness(0)
return
^+b::
ChangeBrightness(100)
return

