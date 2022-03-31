color 0e

dir /b *.mkv>mkv.txt

set /p mkv=<mkv.txt

del mkv.txt

ffmpeg -i "%mkv%" -map 0:0 -map 0:1 -map 0:2 -map 0:3 -c:v copy -c:a copy -c:s mov_text "output.mp4"

set mkv=%mkv:.mkv=%

ren output.mp4 %mkv%.mp4
pause