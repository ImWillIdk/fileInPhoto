@echo off
color c
title Encrypting...
cls
echo . . . . .
set /p ext=What type of file is your image? (png / jpg): 
echo . . . . .
echo Encrypting...
timeout /t 2
cd files-here
copy /y "*.%ext%" ..
copy /y "*.txt" ..
cd ..
move /y "*.txt" assets
cd assets
for %%F in (*.txt) do rar a -ad -df -o- -r -m5 "%%F.rar" "%%F"
move /y "*.rar" ..
cd ..
ren "*.rar" "2.rar"
ren "*.%ext%" "1.%ext%"
copy /b /y 1.%ext% + 2.rar "normal-%ext%.%ext%"
del 1.%ext%
del 2.rar