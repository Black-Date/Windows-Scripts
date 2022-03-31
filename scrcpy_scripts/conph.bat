@echo off
set /p myip=Enter your phone ip: 
adb devices
adb tcpip 5555
adb connect %myip%
pause
adb devices
scrcpy