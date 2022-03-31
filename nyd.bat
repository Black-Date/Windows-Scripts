@ECHO OFF
SET DnBest=--hls-prefer-native --add-metadata -f best
SET DnBestAudVid=--hls-prefer-native --add-metadata
SET DnBestUnmerge=--hls-prefer-native --add-metadata -f "bestvideo,bestaudio"
SET DnBestMP4_MPA=--hls-prefer-native --add-metadata -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
SET DnBestMP4_AAC=--hls-prefer-native --add-metadata -f "bestvideo[ext=mp4]+bestaudio[ext=aac]/best[ext=mp4]/best"
SET DnMP3=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 1 --audio-format mp3
SET DnAAC=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 1 --audio-format aac
SET DnM4A=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 1 --audio-format m4a
SET Dnformat=--no-mtime --add-metadata --merge-output-format "mkv"
SET Dnplaylistformat=--no-mtime --add-metadata --merge-output-format "mkv"
SET Destination="%userprofile%\Downloads\Video\%%(title)s.%%(ext)s "
SET PDestination="%userprofile%\Downloads\Video\%%(playlist)s\%%(playlist_index)s - %%(title)s.%%(ext)s"
SET FastDnld=--external-downloader aria2c --external-downloader-args "-x 16 -s 16 -j 16 -k 1M --file-allocation=none --summary-interval=0"
if not -%1-==-- SET URL=%*
if -%1-==-- goto fopNew
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
CLS
ECHO URL: %URL%
ECHO.
ECHO ###############################
ECHO ##   AVAILABLE OPERATIONS:   ##
ECHO ###############################
ECHO.
::This prints the list of the operations

ECHO 1. Best already on site
ECHO 2. Best Audio and Best Video
ECHO 3. Best (no merge)
ECHO 4. Best MP4 and M4A
ECHO 5. Best MP4 and AAC
ECHO 6. MP3 (Audio)
ECHO 7. AAC (Audio)
ECHO 8. M4A (Audio)
ECHO 9. Download using formats
ECHO 10.Download Playlist using formats
echo.
ECHO ===================================
ECHO f. List all possible Formats
ECHO p. List Playlist Formats 
ECHO u. Auto-update
ECHO n. Process New File
ECHO x. Quit
ECHO -----------------------------------
ECHO.
::Ask the user to choose the operation they want

SET /P operation=Which operation would you like to do?:
if "%operation%"=="n" goto fopNew
if "%operation%"=="N" goto fopNew
if "%operation%"=="1" goto fop1
if "%operation%"=="2" goto fop2
if "%operation%"=="3" goto fop3
if "%operation%"=="4" goto fop4
if "%operation%"=="5" goto fop5
if "%operation%"=="6" goto fop6
if "%operation%"=="7" goto fop7
if "%operation%"=="8" goto fop8
if "%operation%"=="9" goto fop9
if "%operation%"=="10" goto fop10
if "%operation%"=="f" goto fopFormat
if "%operation%"=="F" goto fopFormat
if "%operation%"=="p" goto fopFormatPlaylist
if "%operation%"=="P" goto fopFormatPlaylist
if "%operation%"=="u" goto fopUpdate
if "%operation%"=="U" goto fopUpdate
goto fopQuit


:fop1
ECHO Best:
youtube-dl %DnBest% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop2
ECHO Best Audio and Best Video:
youtube-dl %DnBestAudVid% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop3
ECHO Best No Merge:
youtube-dl %DnBestUnmerge% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop4
ECHO Best MP4 and MPa:
youtube-dl %DnBestMP4_MPA% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop5
ECHO Best MP4 and AAC:
youtube-dl %DnBestMP4_AAC% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop6
ECHO MP3:
youtube-dl %DnMP3% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop7
ECHO AAC:
youtube-dl %DnAAC% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop8
ECHO M4A:
youtube-dl %DnM4A% -o %Destination% %FastDnld% %URL%
pause
goto top

:fop9
ECHO.
SET /p vfor=Enter Video Format: 
SET /p afor=Enter Audio Format: 
ECHO.
youtube-dl %Dnformat% -o %Destination%  -f %vfor%+%afor% %FastDnld% %URL%
pause
goto top

:fop10
ECHO.
SET /p pvfor=Enter Video Format: 
SET /p pafor=Enter Audio Format: 
ECHO.
SET /p sv=Enter Indicies Of Videos: 
ECHO.
youtube-dl %Dnplaylistformat% -o %PDestination% --playlist-items %sv% -f %pvfor%+%pafor% %FastDnld% %URL%
pause
goto top

:fopFormat
youtube-dl -F %URL%
pause
goto top

:fopFormatPlaylist
set /p selectindex=Enter Indices: 
if %selectindex%==0 goto AllPlaylistVids
youtube-dl -F --playlist-items %selectindex% "%URL%"
pause
goto top

:AllPlaylistVids
youtube-dl -F "%URL%"
pause
goto top

:fopUpdate
ECHO Updates:
youtube-dl -U
pause
goto top

:fopNew
SET /P URL=Please enter the URL:
goto top

:fopQuit