:: Print in notepad the location of the shell folders (Desktop, Favorites, ...)

reg QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /s > sfLocation.txt
notepad sfLocation.txt

:: Print Links registry key
reg QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\explorer\FolderDescriptions\{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}"