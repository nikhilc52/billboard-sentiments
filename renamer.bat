@echo off
setlocal enabledelayedexpansion

set "directory=C:\Users\nikhi\OneDrive\Documents\GitHub\billboard-sentiments\writeups\sliders\sentiment_line"
set "year=1964"

cd "%directory%"

rem List PNG files sorted by modification time (oldest first)
for /f "delims=" %%F in ('dir /b /a-d /o:d /t:w *.png') do (
    rem Rename the file
    ren "%%F" "!year!.png"
    rem Increment the year counter
    set /a year+=1
)

pause
