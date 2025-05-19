@echo off & color 8 & mode con cols=34 lines=10 & title Nvidia

echo.
echo. [1] Enable
echo. [2] Disable
echo. [3] ControlPanel
echo.
set /p c="... "
if /i %c% equ 1 goto :Enable
if /i %c% equ 2 goto :Disable
if /i %c% equ 3 goto :ControlPanel

:Enable
(
sc config "NVDisplay.ContainerLocalSystem" start=auto
net start "NVDisplay.ContainerLocalSystem"
start shell:AppsFolder\NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel
) >nul 2>&1 & exit /b

:Disable
(
sc config "NVDisplay.ContainerLocalSystem" start=disabled
net stop "NVDisplay.ContainerLocalSystem"
) >nul 2>&1 & exit /b

:ControlPanel
start shell:AppsFolder\NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel & exit /b