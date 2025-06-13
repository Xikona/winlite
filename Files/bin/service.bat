@echo off & color 88 & mode con cols=38 lines=10 & title Service

echo. ------------------------------------
echo. nvidia              host
echo. ------------------------------------
echo. [1] enable          [4] enable
echo. [2] disable         [5] disable-all
echo. [3] control-panel   [6] disable-cbs
echo. ------------------------------------
echo. [7] icon-patch      [8] theme
echo. ------------------------------------
set /p c="... "
if /i %c% equ 1 goto :en_nv
if /i %c% equ 2 goto :dis_nv
if /i %c% equ 3 goto :controlpanel
if /i %c% equ 4 goto :en_host
if /i %c% equ 5 goto :dis_host
if /i %c% equ 6 goto :dis_cbs
if /i %c% equ 7 goto :def_ico
if /i %c% equ 8 goto :theme

:en_nv
( sc config "NVDisplay.ContainerLocalSystem" start=auto
  net start "NVDisplay.ContainerLocalSystem"
  start shell:AppsFolder\NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel ) >nul 2>&1 & exit /b

:dis_nv
( sc config "NVDisplay.ContainerLocalSystem" start=disabled
  net stop "NVDisplay.ContainerLocalSystem" ) >nul 2>&1 & exit /b

:controlpanel
  start shell:AppsFolder\NVIDIACorp.NVIDIAControlPanel_56jybvy8sckqj!NVIDIACorp.NVIDIAControlPanel & exit /b

:en_host
( taskkill /f /im explorer.exe
  ren "%windir%\System32\RuntimeBroker.exe.bak" "RuntimeBroker.exe"
  ren "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.bak" "ShellExperienceHost_cw5n1h2txyewy"
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy.bak" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe.bak" "TextInputHost.exe"
  start RuntimeBroker.exe & start explorer.exe ) >nul 2>&1 & exit /b

:dis_host
( taskkill /f /im explorer.exe
  taskkill /f /im RuntimeBroker.exe
  taskkill /f /im ShellExperienceHost.exe
  taskkill /f /im TextInputHost.exe
  ren "%windir%\System32\RuntimeBroker.exe" "RuntimeBroker.exe.bak"
  ren "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy" "ShellExperienceHost_cw5n1h2txyewy.bak"
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exe.bak" & timeout /t 1
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy.bak"
  start explorer.exe ) >nul 2>&1 & exit /b

:dis_cbs
( taskkill /f /im explorer.exe
  taskkill /f /im TextInputHost.exe
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exe.bak" & timeout /t 1
  ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy.bak"
  start explorer.exe ) >nul 2>&1 & exit /b

:def_ico
( taskkill /f /im explorer.exe
  if exist "%windir%\SystemResources\imageres.dll.mun.bak" (
  ren "%windir%\SystemResources\imageres.dll.mun" "imageres.dll.mun.bak2"
  ren "%windir%\SystemResources\imageres.dll.mun.bak" "imageres.dll.mun"
  ren "%windir%\SystemResources\imageres.dll.mun.bak2" "imageres.dll.mun.bak" )
  if exist "%windir%\SystemResources\zipfldr.dll.mun.bak" (
  ren "%windir%\SystemResources\zipfldr.dll.mun" "zipfldr.dll.mun.bak2"
  ren "%windir%\SystemResources\zipfldr.dll.mun.bak" "zipfldr.dll.mun"
  ren "%windir%\SystemResources\zipfldr.dll.mun.bak2" "zipfldr.dll.mun.bak" )
  if exist "%windir%\SystemResources\shell32.dll.mun.bak" (
  ren "%windir%\SystemResources\shell32.dll.mun" "shell32.dll.mun.bak2"
  ren "%windir%\SystemResources\shell32.dll.mun.bak" "shell32.dll.mun"
  ren "%windir%\SystemResources\shell32.dll.mun.bak2" "shell32.dll.mun.bak" )
  if exist "%windir%\SystemResources\imagesp1.dll.mun.bak" (
  ren "%windir%\SystemResources\imagesp1.dll.mun" "imagesp1.dll.mun.bak2"
  ren "%windir%\SystemResources\imagesp1.dll.mun.bak" "imagesp1.dll.mun"
  ren "%windir%\SystemResources\imagesp1.dll.mun.bak2" "imagesp1.dll.mun.bak" )
  if exist "%windir%\System32\fontext.dll.bak" (
  ren "%windir%\System32\fontext.dll" "fontext.dll.bak2"
  ren "%windir%\System32\fontext.dll.bak" "fontext.dll"
  ren "%windir%\System32\fontext.dll.bak2" "fontext.dll.bak" )
  cd "%localappdata%\Microsoft\Windows\Explorer"
  del "iconcache*" & del "thumbcache*"
  start explorer.exe ) >nul 2>&1 & exit /b

:theme
  if exist "%windir%\Resources\themes\default.theme" ((
  "%windir%\Resources\themes\Gray.theme" & taskkill /f /im SystemSettings.exe
  ren "%windir%\Resources\themes\default.theme" "default0.theme"
  taskkill /f /im explorer.exe & taskkill /f /im dwm.exe
  reg add "HKCU\Software\Microsoft\Windows\DWM" /t reg_dword /v "ColorPrevalence" /d "1" /f
  reg add "HKCU\Software\StartIsBack" /t reg_dword /v "NavBarGlass" /d "0" /f
  start dwm.exe & start explorer.exe ) >nul 2>&1 & exit /b
) else (
  ren "%windir%\Resources\themes\default0.theme" "default.theme"
  "%windir%\Resources\themes\default.theme" & taskkill /f /im SystemSettings.exe
  taskkill /f /im explorer.exe & taskkill /f /im dwm.exe
  reg add "HKCU\Software\Microsoft\Windows\DWM" /t reg_dword /v "ColorPrevalence" /d "0" /f
  reg add "HKCU\Software\StartIsBack" /t reg_dword /v "NavBarGlass" /d "1" /f
  start dwm.exe & start explorer.exe ) >nul 2>&1 & exit /b