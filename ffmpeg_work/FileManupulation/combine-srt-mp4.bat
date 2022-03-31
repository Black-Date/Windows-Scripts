color 0e

dir /b *.srt>srt.txt
dir /b *.mp4>mp4.txt

set /p mp4=<mp4.txt
set /p srt=<srt.txt

del mp4.txt
del srt.txt

ffmpeg -i "%mp4%" -i "%srt%" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text "%mp4:~0,-4%.mp4"

pause