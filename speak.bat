@echo off

echo set speech = Wscript.CreateObject("SAPI.spVoice")>>"temp.vbs"

echo.

set /p text= Write anything you wanna hear: 

echo speech.speak "%text%">>"temp.vbs"

start temp.vbs

pause

del temp.vbs
