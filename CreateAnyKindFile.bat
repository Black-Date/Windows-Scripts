@echo off
color 0a
title File Maker
set /p f_n= Enter file name: 
set /p f_e= Enter file extension: 
echo.>%f_n%.%f_e%
echo.
echo Done!
echo %f_n%.%f_e% has been created in your current directory!!!
pause