@echo off
color 0A
title SHORTCUT MAKER
cls

echo.

echo WELCOME TO SHORTCUT MAKER
echo.
echo MENU
echo.
echo 1. Create a new Shortcut
echo 2. Delete an existing Shortcut
echo 3. Exit
echo.

set /p char=Enter your Choice : 
cls

if %char% == 1 goto shortcut_maker
if %char% == 2 goto Deletion
if %char% == 3 goto ex
if not %char% == 3 goto ex

:shortcut_maker
cls
set /p sh_n=Enter Shortcut Name: 
set /p sh_f=Enter Folder Name: 
set /p sh_p=Enter program path: 
cls
echo.

echo Your Shortcut Name will be "%sh_n%"
echo Your Folder Name will be "%sh_f%"
echo Your Program Path is "%sh_p%"
echo.
echo 1. Make my Shortcut now!
echo 2. I wanna Enter data again!
echo.
set /p check=Enter your Choice : 

if %check% == 1 goto Begin
if %check% == 2 goto shortcut_maker
if not %check% == 2 goto ex

:Begin

mkdir ShortInfo
cd ShortInfo
echo. > shortfile.txt
echo Shortcut Name - %Sh_n% >> shortfile.txt
echo Shortcut FOLDER - %sh_f% >> shortfile.txt
echo Shortcut Path - %sh_p% >> shortfile.txt

rem 1.

reg add HKEY_CLASSES_ROOT\Directory\Background\shell\%sh_f% /d "%sh_n%"

reg add HKEY_CLASSES_ROOT\Directory\Background\shell\%sh_f% /v Icon /t REG_SZ /d "%sh_p%"

reg add HKEY_CLASSES_ROOT\Directory\Background\shell\%sh_f%\command /t REG_SZ /d "%sh_p%"

rem 2.

reg add HKEY_CLASSES_ROOT\Directory\shell\%sh_f% /d "%sh_n%"

reg add HKEY_CLASSES_ROOT\Directory\shell\%sh_f% /v Icon /t REG_SZ /d "%sh_p%"

reg add HKEY_CLASSES_ROOT\Directory\shell\%sh_f%\command /t REG_SZ /d "%sh_p%"

rem 3.

reg add HKEY_CLASSES_ROOT\*\shell\%sh_f% /d "%sh_n%"

reg add HKEY_CLASSES_ROOT\*\shell\%sh_f% /v Icon /t REG_SZ /d "%sh_p%"

reg add HKEY_CLASSES_ROOT\*\shell\%sh_f%\command /t REG_SZ /d "%sh_p%"

rem 4.

reg add HKEY_CLASSES_ROOT\Drive\shell\%sh_f% /d "%sh_n%"

reg add HKEY_CLASSES_ROOT\Drive\shell\%sh_f% /v Icon /t REG_SZ /d "%sh_p%"

reg add HKEY_CLASSES_ROOT\Drive\shell\%sh_f%\command /t REG_SZ /d "%sh_p%"

cls
echo         *****Congratulations*****
echo Your Shortcut has been created successfully!
echo.
goto ex

:Deletion

set /p shd_n=Enter Shortcut Folder Name: 
set /p ch=Are you sure you wanna delete your shortcut (y/n)? 

if %ch% == y goto del
if %ch% == n goto ex
if not %ch% == n goto ex

:del
reg delete HKEY_CLASSES_ROOT\Directory\Background\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\Directory\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\*\shell\%shd_n% /f
reg delete HKEY_CLASSES_ROOT\Drive\shell\%shd_n% /f
cls
echo Your Shortcut has been Deleted successfully!
goto ex

:ex
pause
