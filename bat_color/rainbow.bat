@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
:echocolors
call :ColorText 0a "r"
call :ColorText 01 "a"
call :ColorText 0b "i"
call :ColorText 09 "n"
call :ColorText 0e "b"
call :ColorText 0d "o"
call :ColorText 05 "w"
echo(
pause
goto echocolors

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof