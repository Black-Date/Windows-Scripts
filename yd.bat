@echo off
title YOUTUBE DOWNLOADER

set log=nul
set currentdir=%cd%
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
pause  
::*******************************************************************
::*******************************************************************
echo.
echo [7m MAIN MENU: [0m
echo.
echo [93m1. Playlist[0m
echo [93m2. Video[0m
echo.
set /p mc=[4m[36mEnter Your Choice[0m[36m: [0m

cd C:\Program Files (x86)\Youtube-dl

    if exist config.txt ( 
                      echo hello
                      set /p dpath=<config.txt
                      for /f "delims=" %%x in (config.txt) do set log=%%x    
    )  else (  
                set dpath=%USERPROFILE%\Downloads\Video\Youtube-dl
        )

if "%dpath%"=="no" set dpath=%USERPROFILE%\Downloads\Video\Youtube-dl
mkdir "%dpath%"

cd %currentdir%
mkdir %APPDATA%\yd_log\Playlists
mkdir %APPDATA%\yd_log\Videos
cls

echo.
set /p link=[4m[96mEnter your Link[0m[96m: [0m

if %mc%==2 goto Video

::Playlist Scene
echo [97m
youtube-dl -e --get-duration %link%
echo [0m

pause
echo [93m
youtube-dl -F %link%
echo [0m

set /p sv=[4m[92mEnter the videos indicies[0m[92m: [0m

echo.
echo [7m MENU: [0m
echo.
echo [91m1. Using One File[0m
echo [91m2. Using Two Files[0m
echo.
set /p c=[4m[36mEnter Your Choice[0m[36m: [0m
echo.

if %c%==1 goto Psingle

::For Multiple files in playlist
echo.
set /p vc=[4m[95mEnter Video Code[0m[95m: [0m
set /p ac=[4m[95mEnter Audio Code[0m[95m: [0m
echo.

if %sv%==0 goto normalm

echo [96m
youtube-dl -o "%dpath%/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --playlist-items %sv% --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %vc%+%ac% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: *******************************************************************************************
cd %APPDATA%
dir "%dpath%" /ad /b /o:d>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Playlists\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Playlists\%a%.txt"
echo #DATE:>>"yd_log\Playlists\%a%.txt"
date /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TIME:>>"yd_log\Playlists\%a%.txt"
time /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TITLES:>>"yd_log\Playlists\%a%.txt"
youtube-dl -e --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DURATIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-duration --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #IDS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-id --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DISCRIPTIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-description --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"

ren "yd_log\Playlists\%a%.txt" "%str%.txt"
:: ******************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your Playlist Is Done. ********** [0m
echo.

goto ex

:normalm
echo [96m
youtube-dl -o "%dpath%/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %vc%+%ac% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: *******************************************************************************************
cd %APPDATA%
dir "%dpath%" /ad /b /o:d>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Playlists\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Playlists\%a%.txt"
echo #DATE:>>"yd_log\Playlists\%a%.txt"
date /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TIME:>>"yd_log\Playlists\%a%.txt"
time /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TITLES:>>"yd_log\Playlists\%a%.txt"
youtube-dl -e %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DURATIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-duration %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #IDS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-id %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DISCRIPTIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-description %link%>>"yd_log\Playlists\%a%.txt"

ren "yd_log\Playlists\%a%.txt" "%str%.txt"
:: ******************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your Playlist Is Done. ********** [0m
echo.

goto ex

::For Single files in playlist
:Psingle
echo.
set /p sn=[4m[95mEnter Your Audio Or Video Choice[0m[95m: [0m
echo.
if %sv%==0 goto normals

echo [96m
youtube-dl -o "%dpath%/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --playlist-items %sv% --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %sn% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: *******************************************************************************************
cd %APPDATA%
dir "%dpath%" /ad /b /o:d>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Playlists\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Playlists\%a%.txt"
echo #DATE:>>"yd_log\Playlists\%a%.txt"
date /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TIME:>>"yd_log\Playlists\%a%.txt"
time /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TITLES:>>"yd_log\Playlists\%a%.txt"
youtube-dl -e --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DURATIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-duration --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #IDS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-id --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DISCRIPTIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-description --playlist-items %sv% %link%>>"yd_log\Playlists\%a%.txt"

ren "yd_log\Playlists\%a%.txt" "%str%.txt"
:: ******************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your Playlist Is Done. ********** [0m
echo.

goto ex

:normals

echo [96m
youtube-dl -o "%dpath%/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %sn% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: *******************************************************************************************
cd %APPDATA%
dir "%dpath%" /ad /b /o:d>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Playlists\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Playlists\%a%.txt"
echo #DATE:>>"yd_log\Playlists\%a%.txt"
date /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TIME:>>"yd_log\Playlists\%a%.txt"
time /t>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #TITLES:>>"yd_log\Playlists\%a%.txt"
youtube-dl -e %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DURATIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-duration %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #IDS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-id %link%>>"yd_log\Playlists\%a%.txt"
echo.>>"yd_log\Playlists\%a%.txt"

echo #DISCRIPTIONS:>>"yd_log\Playlists\%a%.txt"
youtube-dl --get-description %link%>>"yd_log\Playlists\%a%.txt"

ren "yd_log\Playlists\%a%.txt" "%str%.txt"
:: ******************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your Playlist Is Done. ********** [0m
echo.

goto ex

::Video scene
:Video

echo [97m
youtube-dl -e --get-duration %link%
echo [0m

echo [93m
youtube-dl -F %link%
echo [0m

echo [7m MENU: [0m
echo.
echo [91m1. Using One File[0m
echo [91m2. Using Two Files[0m
echo.
set /p c=[4m[36mEnter Your Choice[0m[36m: [0m
echo.

if %c%==1 goto single

echo.
set /p vc=[4m[95mEnter Video Code[0m[95m: [0m
set /p ac=[4m[95mEnter Audio Code[0m[95m: [0m
echo.

echo [96m
youtube-dl -o "%dpath%/%%(title)s.%%(ext)s" --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %vc%+%ac% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: ************************************************************************************
cd %APPDATA%
youtube-dl -e %link%>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Videos\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Videos\%a%.txt"
echo #DATE:>>"yd_log\Videos\%a%.txt"
date /t>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #TIME:>>"yd_log\Videos\%a%.txt"
time /t>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #TITLE:>>"yd_log\Videos\%a%.txt"
youtube-dl -e %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #DURATION:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-duration %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #ID:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-id %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #DISCRIPTION:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-description %link%>>"yd_log\Videos\%a%.txt"

ren "yd_log\Videos\%a%.txt" "%str%.txt"
:: *******************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your File Is Done. ********** [0m
echo.

goto ex

::For single files
:single

echo.
set /p sn=[4m[95mEnter Your Audio Or Video Choice[0m[95m: [0m
echo.

echo [96m
youtube-dl -o "%dpath%/%%(title)s.%%(ext)s" --no-mtime --write-auto-sub --convert-subs "srt" --recode-video "mp4" --embed-subs --embed-thumbnail -f %sn% --external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0" %link%
if %log%==no goto cong

:: *************************************************************************************
cd %APPDATA%
youtube-dl -e %link%>temp.txt
for /f "delims=" %%x in (temp.txt) do set str="%%x"

set str=%str:|=-%
set str=%str::=-%
set str=%str:\=-%
set str=%str:/=-%
set str=%str:?=%
set str=%str:<=-%
set str=%str:>=-%
set str=%str:"=%

del /f temp.txt

echo [Log] Destination: %APPDATA%\yd_log\Videos\%str%.txt
echo [Log] Preparing Log File...
echo [0m

set a=%random%

echo.>"yd_log\Videos\%a%.txt"
echo #DATE:>>"yd_log\Videos\%a%.txt"
date /t>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #TIME:>>"yd_log\Videos\%a%.txt"
time /t>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #TITLE:>>"yd_log\Videos\%a%.txt"
youtube-dl -e %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #DURATION:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-duration %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #ID:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-id %link%>>"yd_log\Videos\%a%.txt"
echo.>>"yd_log\Videos\%a%.txt"

echo #DISCRIPTION:>>"yd_log\Videos\%a%.txt"
youtube-dl --get-description %link%>>"yd_log\Videos\%a%.txt"

ren "yd_log\Videos\%a%.txt" "%str%.txt"
:: ************************************************************************************
:cong
echo.
echo [101;93m ********** Congratulations! Your File Is Done. ********** [0m
echo.

:ex
cd %currentdir%
title Command Prompt
pause
