@echo off
set /p myip=Enter your phone ip: 
adb devices
adb connect %myip%
scrcpy