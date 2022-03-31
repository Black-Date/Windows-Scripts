@echo on
color 0e
setlocal enabledelayedexpansion
mkdir OldVideoAndSubs
dir /b *.mp4 *.mkv>videonames.txt

for /f "delims=" %%i in (videonames.txt) do (

set name=%%i
set exten=!name:~-4!
set name=!name:~0,-4!

if !exten!==.mkv (
ffmpeg -i "!name!.mkv" -i "!name!.srt" -map 0:0 -map 0:1 -map 1:0 -c:a copy -c:v copy -c:s mov_text output.mp4
move "!name!.mkv" OldVideoAndSubs\
move "!name!.srt" OldVideoAndSubs\
ren output.mp4 "!name!.mp4"
)

if !exten!==.mp4 (
ffmpeg -i "!name!.mp4" -i "!name!.srt" -map 0:0 -map 0:1 -map 1:0 -c:a copy -c:v copy -c:s mov_text output.mp4
move "!name!.mp4" OldVideoAndSubs\
move "!name!.srt" OldVideoAndSubs\
ren output.mp4 "!name!.mp4"
)

)

del videonames.txt
pause