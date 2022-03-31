@echo off
set /a i=0
set /a j=1

:start
echo.
color %i%%j%
echo This colour is corresponding to %i%%j%.
echo.
echo.
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!
echo A quick brown fox jumps over the lazy dog!

set /a j+=1

pause

cls

if %j% LEQ 9 (goto start)

set /a i+=1
set /a j=0

if %i% LEQ 9 (goto start)

color 07

echo YOU'VE SEEN ALL COLORS BABY!!!
 
pause
