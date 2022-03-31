@echo off & setlocal enabledelayedexpansion
for %%v in ("*.mkv") do (
  set FileName=%%v
  set name=!FileName:~0,-4!

  set outname=H:\Temp\!name!
  echo Remuxing: !name! to !outname!

  ffmpeg -i "!FileName!" -map 0:v -c copy "!outname!.mp4" -map 0:a:0 -c copy "!outname!_0.aac" -map 0:a:1 -c copy "!outname!_1.aac" -map 0:a:2 -c copy "!outname!_2.aac"
)
pause