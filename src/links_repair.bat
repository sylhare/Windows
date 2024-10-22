@echo off 

setlocal
set folder=Links

echo Repairing %folder% folder

:: Kill explorer.exe
taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

:: Recreate the folder if deleted
if not exist "%UserProfile%\%folder%" mkdir "%UserProfile%\%folder%"

:: restore the default location of the folder in the registry
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_SZ /d "C:\Users\%USERNAME%\%folder%" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\%folder%" /f

::restore the default attributes of the folder
attrib +r -s -h "%USERPROFILE%\%folder%" /S /D

timeout /t 1 /nobreak >nul

::restore explorer.exe
start explorer.exe

endlocal