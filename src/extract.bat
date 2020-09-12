:: FOR %%X in (*.rar *.zip) DO ("D:\Program Files\7-Zip\7z.exe" x "%%X" -o "%%X")

FOR %%X in (*.rar *.zip) DO CALL :Extract %%X
GOTO End

:Extract
SET path=%1
"D:\Program Files\7-Zip\7z.exe" x "%path%" "-o%path:.zip=%"
:: PAUSE
GOTO :eof

:End