@echo off
SET Destination="%userprofile%/Downloads/Video/%%(title)s.%%(ext)s"
SET FastDnld=--external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0"
SET Dnformat=--no-mtime --add-metadata --merge-output-format "mkv"
::*******************************************************************
::*******************************************************************
echo.
echo.
echo.
echo.
echo  MMMM   MMMMM   MMMM  MMMMMMMMMMM   MMMM            hMMMMMM         MMMMMMM      MMMMMM    MMMMMM   MMMMMMMMMMM   MMMM
echo  MMMM   MMMMM   MMMM  MMMMMMMMMMM   MMMM          MMMMMMMMMMM     MMMMMMMMMMM    MMMMMM    MMMMMM   MMMMMMMMMMM   MMMM
echo  MMMMN  MMMMMM  MMMM  MMMM          MMMM         MMMMM    MMMM   MMMM    MMMMM   MMMMMMM  MMMMMMM   MMMM          MMMM
echo   MMMM MMMNMMM MMMM   MMMMMMMMMMM   MMMM         MMMM           MMMMM     MMMMM  MMMMMMM  MMMMMMM   MMMMMMMMMMM   MMMM
echo   MMMM MMM MMMMMMMM   MMMMMMMMMMM   MMMM         MMMM           MMMM      MMMMM  MMMM MMMhMM MMMM   MMMMMMMMMMM   MMMM
echo    MMMMMMM  MMMMMMN   MMMM          MMMM         MMMM           MMMMM     MMMMM  MMMM MMMMMM MMMM   MMMM          NMMM
echo    MMMMMM   MMMMMM    MMMM          MMMM         MMMMM    MMMM   MMMM     MMMM   MMMM MMMMMM MMMM   MMMM
echo    MMMMMM   MMMMMM    MMMMMMMMMMMM  MMMMMMMMMMM   MMMMMMMMMMM     MMMMMMMMMMM    MMMM  MMMM  MMMM   MMMMMMMMMMMM  MMMM
echo     MMMM     MMMM     MMMMMMMMMMMM  MMMMMMMMMMM     MMMMMMMM       MMMMMMMMM     MMMM  MMMM  MMMM   MMMMMMMMMMMM  MMMM
echo.
echo.
echo.
::*******************************************************************
::*******************************************************************
:top
set /p link=Enter your Link: 
echo.
youtube-dl -F "%link%"
echo.
echo    1 For 144p
echo    2 For 240p
echo    3 For 360p
echo    4 For 480p
echo    5 For 720p
echo    6 For 1080p
echo.
SET /P height=Enter Format Menu Number: 
echo.
if "%height%"=="1" goto h144
if "%height%"=="2" goto h240
if "%height%"=="3" goto h360
if "%height%"=="4" goto h480
if "%height%"=="5" goto h720
if "%height%"=="6" goto h1080

:h144
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=144]+worstaudio/worstvideo[height=240]+worstaudio/worstvideo[height=360]+worstaudio/worstvideo[height=480]+worstaudio/worstvideo[height=720]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top

:h240
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=240]+worstaudio/worstvideo[height=360]+worstaudio/worstvideo[height=480]+worstaudio/worstvideo[height=720]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top

:h360
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=360]+worstaudio/worstvideo[height=480]+worstaudio/worstvideo[height=720]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top

:h480
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=480]+worstaudio/worstvideo[height=720]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top

:h720
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=720]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top

:h1080
youtube-dl %Dnformat% -o %Destination% %FastDnld% -f "worstvideo[height=1080]+worstaudio/bestvideo+bestaudio/best" "%link%"
pause
echo.
goto top
