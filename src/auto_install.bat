:: Loop through the current file in the directory and start the installation
:: You need 2 % when running this in a .bat, otherwise only 1
:: FOR /r %%i in (*.exe) DO START %%i /W

:: The /VERYSILENT makes it with less windows as possible (be careful) and /NORESTART prevent it for rebooting
FOR /r %%i in (*.exe) DO %%i /VERYSILENT /NORESTART
