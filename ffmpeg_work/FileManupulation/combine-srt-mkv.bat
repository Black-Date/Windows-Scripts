color 0e

dir /b *.srt>srt.txt
dir /b *.mkv>mkv.txt

set /p mkv=<mkv.txt
set /p srt=<srt.txt

del mkv.txt
del srt.txt

ffmpeg -i "%mkv%" -i "%srt%" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text "%mkv:~0,-4%.mp4"

pause