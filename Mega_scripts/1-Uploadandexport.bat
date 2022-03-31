color 0e
set mpath=%localappdata%\MEGAcmd\MEGAclient

set fold1=Path of Folder or File
set fold2=Path of Folder or File
set fold3=Path of Folder or File

"%mpath%" login EMAIL-ID PASSWORD

"%mpath%" put "%fold1%"
"%mpath%" export -a -f "%fold1%">>exportinfo.txt
"%mpath%" du -h "%fold1%">>sizeinfo.txt


"%mpath%" put "%fold2%"
"%mpath%" export -a -f "%fold2%">>exportinfo.txt
"%mpath%" du -h "%fold2%">>sizeinfo.txt


"%mpath%" put "%fold3%"
"%mpath%" export -a -f "%fold3%">>exportinfo.txt
"%mpath%" du -h "%fold3%">>sizeinfo.txt

::"%mpath%" logout

pause
