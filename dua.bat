@echo off
rem echo you first typed "%~1" then you typed "%~2"
mkdir "%USERPROFILE%\Downloads\Aria2c"
echo.
echo.
aria2c -x 16 -s 16 -j 16 -k 1M --continue=true --dir="%USERPROFILE%\Downloads\Aria2c" --file-allocation=none --summary-interval=0 "%~1"
explorer "%USERPROFILE%\Downloads\Aria2c"

