@echo on
color 0E
setlocal enabledelayedexpansion

for /l %%i in ( 0 1 4 ) do (
    
    jq -r ".array[%%i].size" size.json>tempsize.txt
    jq -r ".array[%%i].name" nameslinks.json>tempname.txt
    jq -r ".array[%%i].link" nameslinks.json>templink.txt

    set /p name=<tempname.txt
    set /p link=<templink.txt
    set /p size=<tempsize.txt

    echo """<tr>""">>elementshtml.txt
    echo """<td><a href="!link!" target="_blank">!name!</a> </td>""">>elementshtml.txt
    echo """<td>!size!</td>""">>elementshtml.txt
    echo """</tr>""">>elementshtml.txt
    echo.>>elementshtml.txt
)

DEL /F /Q tempname.txt
DEL /F /Q templink.txt
DEL /F /Q tempsize.txt

pause