@echo off & %1 start ""/min cmd /c "%~f0" :& exit /b

taskkill /f /im explorer.exe
cd "%localappdata%\Microsoft\Windows\Explorer"
del "iconcache*" & del "thumbcache*"
start explorer.exe