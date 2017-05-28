@echo off
:: Will print line by line all the path of the path environment variable

:: create a string value in which we store the path variable
set "str=%path%"

:: We specify ";" as teh delimitor and we print each path, even if there's a space in between
FOR %%S in ("%str:;=" "%") DO echo %%~S

pause