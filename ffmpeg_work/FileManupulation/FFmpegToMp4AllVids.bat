@echo on
color 0e
setlocal enabledelayedexpansion

dir /ad /s /b>alldirlist.txt
dir /b *.mp4 *.mkv>listofvideos.txt

set parentdir=!cd!

for /f "delims=" %%i in (listofvideos.txt) do (

set newname=%%i
set newname=!newname:~0,-4!
ffmpeg -i "%%i" "D:\VidProcess\!newname!.mp4"

)

for /f "delims=" %%j in (alldirlist.txt) do (
cd %%j
dir /b *.mp4 *.mkv >!parentdir!\listofvideos.txt
cd !parentdir!

for /f "delims=" %%k in (listofvideos.txt) do (

set newname=%%k
set newname=!newname:~0,-4!
ffmpeg -i "%%k" "%%j\!newname!.mp4"

)

)

DEL /F /Q alldirlist.txt
DEL /F /Q listofvideos.txt
pause
