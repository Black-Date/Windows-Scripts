@echo off
color 0A

set /p shd_n="Enter Shortcut Name: "

set /p ch="Are you sure to delete your shortcut (y/n)? "

if %ch% == y goto del
if %ch% == n goto ex

:del
reg delete HKEY_CLASSES_ROOT\Directory\Background\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\Directory\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\*\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\Drive\shell\%shd_n% /f
goto ex

:ex
pause
