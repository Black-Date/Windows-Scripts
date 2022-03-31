::@echo off
::set /p name=Enter File Name: 
::ffmpeg -i "%name%" -c copy -map 0 "%name.mp4%"
::pause

@echo off & setlocal enabledelayedexpansion
set /p name=Enter File Name: 
ffmpeg -i "%name%" -c copy -map 0 "!name:~0,-4!mp4"
pause