@echo off
color 0E
setlocal enabledelayedexpansion

echo {>>nameslinks.json
echo "array": [>>nameslinks.json 
echo {>>size.json
echo "array": [>>size.json

for /f "tokens=1,3 delims=:" %%i in (exportinfo.txt) do (

    set rmexport=%%i
    set rmexport=!rmexport:Exported /=!
    echo { "name": "!rmexport!",>>nameslinks.json
    echo  "link": "https:%%j" },>>nameslinks.json
	echo.>>nameslinks.json
)

for /f "tokens=1,2 delims=:" %%k in (sizeinfo.txt) do ( 

if "%%k" EQU "Total storage used" (

echo %%l>tempsizeinfo.txt

for /f "tokens=1,2" %%a in (tempsizeinfo.txt) do (

echo { "size": "%%a %%b" },>>size.json
echo.>>size.json

)

)

)

echo ]>>nameslinks.json
echo }>>nameslinks.json
echo ]>>size.json
echo }>>size.json

DEL /F /Q tempsizeinfo.txt
pause