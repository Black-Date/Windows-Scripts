@echo off
color 0e
setlocal enabledelayedexpansion

dir /b *.mkv>mkvnames.txt

for /f "delims=" %%i in (mkvnames.txt) do (
set name=%%i
set name=!name:.mkv=!

ffmpeg -i !name!.mkv -i !name!.srt -map 0:0 -map 0:1 -map 1:0 -c:a copy -c:v copy -c:s mov_text !name!.mp4

)

pause