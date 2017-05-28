@echo off
:: https://stackoverflow.com/questions/2524928/dos-batch-iterate-through-a-delimited-string
set servers=127.0.0.1,192.168.0.1,10.100.0.1

call :parse "%servers%"
goto :end


:parse
setlocal

:: Set list as the first argument of the parse function
set list=%1

::Removing the " from the previous set
set list=%list:"=%


::Look for the first token in elements of list
FOR /f "tokens=1* delims=," %%i IN ("%list%") DO (
  if not "%%a" == "" call :sub %%i
  if not "%%b" == "" call :parse "%%j"
)
endlocal

::exit /b When used in a batch script, this option will exit only the script (or subroutine) but not CMD.EXE
exit /b

:sub
setlocal
echo ---------------------
echo .
echo %1
ping %1
endlocal
exit /b

:end

pause