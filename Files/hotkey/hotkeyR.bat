@echo off & %1 start ""/min cmd /c "%~f0" :& exit /b

taskkill /f /im HotkeyP.exe & start "" "%windir%\Extras\Hotkey\HotkeyP.exe"