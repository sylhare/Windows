@echo off   & ::Remove the start of the prompt "C:Users\usr>"

:: xcopy [source] [destination]
xcopy C:"Users%username%Documents" F: e/q/y   


exit    