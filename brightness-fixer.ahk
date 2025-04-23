#SingleInstance

GroupAdd, programs, ahk_exe Code.exe
GroupAdd, programs, ahk_exe idea64.exe


;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: 
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% 
;=============================================


ChangeBrightness(0)
Sleep, 100
return

ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
    if ( brightness >= 0 && brightness <= 100 )
    {
        For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
            property.WmiSetBrightness( timeout, brightness )
    }
    else if ( brightness > 100 )
    {
        brightness := 100
    }
    else if ( brightness < 0 )
    {
        brightness := 0
    }
}


^h::
    ChangeBrightness(brightness += 5)
    return
^j:: 
    ChangeBrightness(brightness -= 5)

#IfWinNotActive ahk_group programs
^b::
ChangeBrightness(100)
return
^+b::
ChangeBrightness(0)
return

