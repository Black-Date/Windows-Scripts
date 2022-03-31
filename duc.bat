@echo off
rem echo you first typed "%~1" then you typed "%~2"
mkdir "%USERPROFILE%\Downloads\curl"
echo.
echo.
if "%~1"=="+" ( 
                curl --insecure --continue-at - --show-error --remote-name --location --output-dir "%USERPROFILE%\Downloads\curl" %~2
				explorer "%USERPROFILE%\Downloads\curl"
                goto end
            )

curl --progress-bar --continue-at - --show-error --insecure --remote-name --location --output-dir "%USERPROFILE%/Downloads/curl" %~1
explorer "%USERPROFILE%\Downloads\curl"
:end
echo.
