@ECHO OFF
color 0E
setlocal enabledelayedexpansion

netsh interface ip show addresses | findstr "Configuration for interface">ip_adapters_names.txt

for /f "delims=" %%i in (ip_adapters_names.txt) do ( 
    set line=%%i
    set line=!line:"=#!
    echo !line! >>edited_adapeters_names.txt
)
for /f "tokens=2 delims=#" %%j in (edited_adapeters_names.txt) do echo %%j>>final_adapters_names.txt

DEL /F /Q ip_adapters_names.txt
DEL /F /Q edited_adapeters_names.txt

set check=0
set adapter_ip=0
echo __________________________________________________________
for /f "delims=" %%k in (final_adapters_names.txt) do (

    netsh interface ip show config name="%%k" | findstr "IP Address">temp_adapter_ip.txt
    for /f "tokens=3 delims= " %%l in (temp_adapter_ip.txt) do set adapter_ip=%%l
    if !check!==!adapter_ip! (
         set adapter_ip=IP Not Available 
    )
    set check=!adapter_ip!
    echo.
    echo %%k:-
    echo !adapter_ip!
    echo __________________________________________________________

)
DEL /F /Q temp_adapter_ip.txt
DEL /F /Q final_adapters_names.txt
echo.
echo.
echo.
pause