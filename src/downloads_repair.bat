@echo off 

taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Downloads" mkdir "%UserProfile%\Downloads"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Downloads" /f

attrib +r -s -h "%USERPROFILE%\Downloads" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe
