@echo off
setlocal enabledelayedexpansion

set "directory=C:\Users\nikhi\Downloads\feature_chart_images - Copy"
set "year=1961"

cd "%directory%"

rem List PNG files sorted by modification time (oldest first)
for /f "delims=" %%F in ('dir /b /a-d /o:d /t:w *.png') do (
    rem Rename the file
    ren "%%F" "!year!.png"
    rem Increment the year counter
    set /a year+=1
)

pause
