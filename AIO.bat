@echo off & color 88 & mode con cols=52 lines=18 & title AIO & chcp 65001 >nul 2>&1

echo.
echo. [1] nvidia
echo. [2] script
echo. [3] iconspatch
echo. [4] apps
echo. [5] hostdisable
echo. [6] activation
echo. [7] chocolatey
echo. [8] chocoinstall
echo.
set /p c="Choice: "
if /i %c% equ 1 goto :nvidia
if /i %c% equ 2 goto :script
if /i %c% equ 3 goto :iconspatch
if /i %c% equ 4 goto :apps
if /i %c% equ 5 goto :hostdisable
if /i %c% equ 6 goto :activation
if /i %c% equ 7 goto :chocolatey
if /i %c% equ 8 goto :chocoinstall

:nvidia
( label C:Disk & mkdir "%windir%\Extras"
copy "Files\Nvidia\nvidia.bat" "%windir%\Extras"
cd /d "%~dp0Files\Nvidia" & Nvidia.exe
reg delete "HKEY_CURRENT_USER\Software\techPowerUp" /f ) >nul 2>&1
echo. & echo. [1] 75hz & echo. [2] No & echo.
set /p c="Choice: "
if /i %c% equ 1 goto :75hz
if /i %c% equ 2 goto :no
:75hz
75Hz.exe /i
restart-only.exe & exit /b
:no
exit /b

:script
echo. & echo. Script is running...
:: активация
set "act=cscript /nologo "%windir%\System32\slmgr.vbs" //b"
%act% /ipk "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" & %act% /skms kms.digiboy.ir & %act% /ato
:: тема
( copy "Files\theme" "%windir%\Resources\themes" & xcopy "Files\theme" "%windir%\Resources\themes" /e /y /q
"%windir%\Resources\themes\Gray.theme" & taskkill /f /im SystemSettings.exe & Files\bin\cursor.exe
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Cursors\Schemes" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Cursors\Schemes" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "AppStarting" /d "%windir%\Cursors\Black\AppStarting.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Arrow" /d "%windir%\Cursors\Black\Arrow.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_sz /v "Crosshair" /d "%windir%\Cursors\Black\Crosshair.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Hand" /d "%windir%\Cursors\Black\Hand.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Help" /d "%windir%\Cursors\Black\Help.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_sz /v "IBeam" /d "%windir%\Cursors\Black\IBeam.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "No" /d "%windir%\Cursors\Black\No.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "NWPen" /d "%windir%\Cursors\Black\NWPen.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "SizeAll" /d "%windir%\Cursors\Black\SizeAll.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "SizeNESW" /d "%windir%\Cursors\Black\SizeNESW.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "SizeNS" /d "%windir%\Cursors\Black\SizeNS.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "SizeNWSE" /d "%windir%\Cursors\Black\SizeNWSE.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "SizeWE" /d "%windir%\Cursors\Black\SizeWE.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "UpArrow" /d "%windir%\Cursors\Black\UpArrow.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Wait" /d "%windir%\Cursors\Black\Wait.ani" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Person" /d "%windir%\Cursors\Black\Person.cur" /f
reg add "HKCU\Control Panel\Cursors" /t reg_expand_sz /v "Pin" /d "%windir%\Cursors\Black\Pin.cur" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /t reg_dword /v "EnableTransparency" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /t reg_dword /v "ColorPrevalence" /d "1" /f
taskkill /f /im dwm.exe & reg add "HKCU\Software\Microsoft\Windows\DWM" /t reg_dword /v "ColorPrevalence" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /t reg_dword /v "VisualFXSetting" /d "3" /f
reg add "HKCU\Control Panel\Desktop" /t reg_binary /v "UserPreferencesMask" /d "9e1e038012000000" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /t reg_dword /v "DisableLogonBackgroundImage" /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t reg_dword /v "UseDefaultTile" /d "1" /f
copy "Files\bin\user-192.png" "C:\ProgramData\Microsoft\User Account Pictures"
reg add "HKCU\Software\Microsoft\Windows\DWM" /t reg_dword /v "AccentColor" /d "2434341" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /t reg_dword /v "AccentColorInactive" /d "2434341" /f
:: console
reg delete "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "FontSize" /t reg_dword /d "1310729" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "FontFamily" /t reg_dword /d "54" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "FontWeight" /t reg_dword /d "700" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "FaceName" /t reg_sz /d "Consolas" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "CursorType" /t reg_dword /d "0" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "InterceptCopyPaste" /t reg_dword /d "0" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "ScreenBufferSize" /t reg_dword /d "589889636" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "WindowSize" /t reg_dword /d "1572964" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "ColorTable00" /t reg_dword /d "1644825" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "WindowAlpha" /t reg_dword /d "255" /f
reg add "HKCU\Console\%%SystemRoot%%_System32_cmd.exe" /v "WindowPosition" /t reg_dword /d "13107700" /f
reg delete "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "FontSize" /t reg_dword /d "1310729" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "FontFamily" /t reg_dword /d "54" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "FontWeight" /t reg_dword /d "700" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "FaceName" /t reg_sz /d "Consolas" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "CursorType" /t reg_dword /d "0" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "InterceptCopyPaste" /t reg_dword /d "0" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "ScreenBufferSize" /t reg_dword /d "589889636" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "WindowSize" /t reg_dword /d "1572964" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "ColorTable00" /t reg_dword /d "1644825" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "WindowAlpha" /t reg_dword /d "255" /f
reg add "HKCU\Console\%%SystemRoot%%_system32_WindowsPowerShell_v1.0_PowerShell.exe" /v "WindowPosition" /t reg_dword /d "13107700" /f
:: taskmanager
mkdir "%userprofile%\AppData\Local\Microsoft\Windows\TaskManager"
copy "Files\bin\settings.json" "%userprofile%\AppData\Local\Microsoft\Windows\TaskManager\settings.json"
:: проводник
taskkill /f /im explorer.exe & reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /t reg_dword /v "IconSize" /d "32" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "ShowInfoTip" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /t reg_dword /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /t reg_dword /v "{645FF040-5081-101B-9F08-00AA002F954E}" /d "1" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /t reg_sz /v "IconSpacing" /d "-1072" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /t reg_binary /v "PageSpaceControlSizer" /d "a0000000000000000000000063040000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /t reg_binary /v "PreviewPaneSizer" /d "3b0000000000000000000000fe030000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "ShowStatusBar" /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /f
fsutil behavior set disableLastAccess 1
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /t reg_sz /v "FolderType" /d "NotSpecified" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /t reg_sz /v "MaxCachedIcons" /d "4096" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons\C\DefaultIcon" /ve /d "%SystemRoot%\system32\imageres.dll,-36" /f
:: вид папок
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f114000000000000000000000000000000d0020000cc0200003153505305d5cdd59^
c2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007b0^
0300030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d00300030003000300030003000300030^
0030003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e000000130000000100^
00005b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001c0000^
000100000030f125b7ef471a10a5f102608c9eebac0a00000001000000250000001400000000470072006f0075007000560069006500770000000b00000000000^
0001b0000000a000000004d006f006400650000001300000003000000230000001200000000490063006f006e00530069007a00650000001300000010000000b^
d000000100000000043006f006c0049006e0066006f000000420000001e000000700072006f007000340032003900340039003600370032003900350000000000^
78000000fddfdffd100000000000000000000000040000001800000030f125b7ef471a10a5f102608c9eebac0a0000001001000030f125b7ef471a10a5f102608c9e^
ebac0e0000009000000030f125b7ef471a10a5f102608c9eebac040000007800000030f125b7ef471a10a5f102608c9eebac0c000000500000002f0000001e000000^
00470072006f0075007000420079004b00650079003a00500049004400000013000000000000001f0000000e00000000460046006c00610067007300000013000^
000010020413100000020000000004c006f0067006900630061006c0056006900650077004d006f0064006500000013000000040000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{7D49D726-3C21-4F05-99AA-FDC2C9474656}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f114000000000000000000000000000000d0020000cc0200003153505305d5cdd59c^
2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007b003^
00030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d00300030003000300030003000300030003^
0003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e0000001300000001000000^
5b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001c000000010^
0000030f125b7ef471a10a5f102608c9eebac0a00000001000000250000001400000000470072006f0075007000560069006500770000000b000000000000001b0^
000000a000000004d006f006400650000001300000003000000230000001200000000490063006f006e00530069007a00650000001300000010000000bd000000^
100000000043006f006c0049006e0066006f000000420000001e000000700072006f00700034003200390034003900360037003200390035000000000078000000^
fddfdffd100000000000000000000000040000001800000030f125b7ef471a10a5f102608c9eebac0a0000001001000030f125b7ef471a10a5f102608c9eebac0e000^
0009000000030f125b7ef471a10a5f102608c9eebac040000007800000030f125b7ef471a10a5f102608c9eebac0c000000500000002f0000001e000000004700720^
06f0075007000420079004b00650079003a00500049004400000013000000000000001f0000000e00000000460046006c00610067007300000013000000010020^
413100000020000000004c006f0067006900630061006c0056006900650077004d006f0064006500000013000000040000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{885A186E-A440-4ADA-812B-DB871B942259}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f114000000000000000000000000000000d0020000cc0200003153505305d5cdd59c^
2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007b003^
00030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d00300030003000300030003000300030003^
0003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e0000001300000001000000^
5b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001c000000010^
0000030f125b7ef471a10a5f102608c9eebac0e000000ffffffff250000001400000000470072006f0075007000560069006500770000000b000000000000001b0000^
000a000000004d006f006400650000001300000003000000230000001200000000490063006f006e00530069007a00650000001300000010000000bd00000010^
0000000043006f006c0049006e0066006f000000420000001e000000700072006f00700034003200390034003900360037003200390035000000000078000000f^
ddfdffd100000000000000000000000040000001800000030f125b7ef471a10a5f102608c9eebac0a0000001001000030f125b7ef471a10a5f102608c9eebac0e00^
00009000000030f125b7ef471a10a5f102608c9eebac040000007800000030f125b7ef471a10a5f102608c9eebac0c000000500000002f0000001e000000004700^
72006f0075007000420079004b00650079003a00500049004400000013000000000000001f0000000e00000000460046006c006100670073000000130000000^
10020413100000020000000004c006f0067006900630061006c0056006900650077004d006f0064006500000013000000040000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{B3690E58-E961-423B-B687-386EBFD83239}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f114000000000000000000000000000000e8020000e40200003153505305d5cdd5^
9c2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007^
b00300030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d00300030003000300030003000300^
0300030003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e00000013000000^
010000005b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001^
c0000000100000030f125b7ef471a10a5f102608c9eebac0a00000001000000250000001400000000470072006f0075007000560069006500770000000b00000^
0000000001b0000000a000000004d006f006400650000001300000001000000230000001200000000490063006f006e00530069007a0065000000130000003^
0000000d5000000100000000043006f006c0049006e0066006f000000420000001e000000700072006f0070003400320039003400390036003700320039003^
5000000000090000000fddfdffd100000000000000000000000050000001800000030f125b7ef471a10a5f102608c9eebac0a000000a0000000b474dbf787420^
341afbaf1b13dcd75cf64000000a000000030f125b7ef471a10a5f102608c9eebac040000007800000030f125b7ef471a10a5f102608c9eebac0c000000500000^
00e0859ff2f94f6810ab9108002b27b3d905000000580000002f0000001e00000000470072006f0075007000420079004b00650079003a0050004900440000^
0013000000000000001f0000000e00000000460046006c00610067007300000013000000010020413100000020000000004c006f0067006900630061006c0^
056006900650077004d006f0064006500000013000000030000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{D6D9E004-CD87-442B-9D57-5E0AEB4F6F72}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f11400000000000000000000000000000000030000fc0200003153505305d5cdd59c^
2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007b00^
300030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d003000300030003000300030003000300^
030003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e0000001300000001000^
0005b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001c00000^
001000000334b179bff40d211a27e00c04fc3087103000000ffffffff250000001400000000470072006f0075007000560069006500770000000b000000000000001^
b0000000a000000004d006f006400650000001300000003000000230000001200000000490063006f006e00530069007a00650000001300000010000000ed000^
000100000000043006f006c0049006e0066006f000000420000001e000000700072006f007000340032003900340039003600370032003900350000000000a800^
0000fddfdffd100000000000000000000000060000001800000030f125b7ef471a10a5f102608c9eebac0a000000f0000000334b179bff40d211a27e00c04fc30871^
02000000f0000000334b179bff40d211a27e00c04fc3087103000000a000000030f125b7ef471a10a5f102608c9eebac0c00000050000000a66a63283d95d211b5d^
600c04fd918d00b0000007800000030f125b7ef471a10a5f102608c9eebac0e000000900000002f0000001e00000000470072006f0075007000420079004b00650^
079003a00500049004400000013000000000000001f0000000e00000000460046006c00610067007300000013000000110020013100000020000000004c006f0^
067006900630061006c0056006900650077004d006f0064006500000013000000040000000000000000000000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /t reg_binary /v "{5FA96407-7E77-483C-AC93-691D05850DE8}" /d ^
1c000000000000000000000000000000000000000000000000000000f1f1f1f114000000000000000000000000000000e8020000e40200003153505305d5cdd59^
c2e1b10939708002b2cf9ae830000002200000000470072006f0075007000420079004b00650079003a0046004d005400490044000000080000004e0000007b0^
0300030003000300030003000300030002d0030003000300030002d0030003000300030002d0030003000300030002d00300030003000300030003000300030^
0030003000300030007d0000000000330000002200000000470072006f00750070004200790044006900720065006300740069006f006e000000130000000100^
00005b0000000a0000000053006f00720074000000420000001e000000700072006f0070003400320039003400390036003700320039003500000000001c0000^
000100000030f125b7ef471a10a5f102608c9eebac0a00000001000000250000001400000000470072006f0075007000560069006500770000000b00000000000^
0001b0000000a000000004d006f006400650000001300000001000000230000001200000000490063006f006e00530069007a00650000001300000030000000d^
5000000100000000043006f006c0049006e0066006f000000420000001e000000700072006f007000340032003900340039003600370032003900350000000000^
90000000fddfdffd100000000000000000000000050000001800000030f125b7ef471a10a5f102608c9eebac0a000000a0000000b474dbf787420341afbaf1b13dc^
d75cf64000000a000000030f125b7ef471a10a5f102608c9eebac040000007800000030f125b7ef471a10a5f102608c9eebac0c00000050000000900444648b4cd1^
118b70080036b11a0303000000780000002f0000001e00000000470072006f0075007000420079004b00650079003a0050004900440000001300000000000000^
1f0000000e00000000460046006c00610067007300000013000000010020413100000020000000004c006f0067006900630061006c0056006900650077004d00^
6f0064006500000013000000030000000000000000000000 /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /t reg_binary /v "MRUListEx" /d "00000000ffffffff" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /t reg_binary /v "0" /d "14001f50e04fd020ea3a6910a2d808002b30309d0000" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /t reg_binary /v "NodeSlots" /d "0202" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU\0" /t reg_dword /v "NodeSlot" /d "1" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\Shell\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_dword /v "Mode" /d "1" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\Shell\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_binary /v "Sort" /d ^
000000000000000000000000000000000100000030f125b7ef471a10a5f102608c9eebac0a000000ffffffff /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\Shell\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_sz /v "GroupByKey:FMTID" /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\Shell\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_dword /v "GroupByKey:PID" /d "0" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\ComDlg\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_dword /v "Mode" /d "1" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\ComDlg\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_binary /v "Sort" /d ^
000000000000000000000000000000000100000030f125b7ef471a10a5f102608c9eebac0a000000ffffffff /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\ComDlg\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_sz /v "GroupByKey:FMTID" /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\1\ComDlg\{5C4F28B5-F869-4E84-8E60-F11DB97C5CC7}" /t reg_dword /v "GroupByKey:PID" /d "0" /f & start explorer.exe
:: startallback
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_LargeMFUIcons" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_MinMFU" /d "16" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_NotifyNewApps" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_AutoCascade" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "HideUserFrame" /d "1" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_ShowUser" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_ShowMyMusic" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_ShowRecentDocs" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_ShowRun" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "SysTrayActionCenter" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "FrameStyle" /d "2" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "UndeadControlPanel" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "RestyleControls" /d "1" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "StartMetroAppsFolder" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_SortOverride" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "TaskbarCenterIcons" /d "2" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "SysTrayClockFormat" /d "3" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "NavBarGlass" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "TaskbarColor" /d "1644825" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "StartMenuColor" /d "1644825" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "OldSearch" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "NoXAMLMenus" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "FatTaskbar" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "TaskbarTranslucentEffect" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "SysTrayInputSwitch" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "SysTrayVolume" /d "0" /f
reg add "HKCU\Software\StartIsBack" /t reg_dword /v "Start_SortOverride" /d "1" /f
reg add "HKCU\Software\StartIsBack" /t reg_sz /v "OrbBitmap" /d "C:\Program Files\StartAllBack\Orbs\start.svg" /f
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\7-Zip"
attrib +h "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h "%appdata%\Microsoft\Windows\Start Menu\Programs\Administrative Tools"
attrib +h "%appdata%\Microsoft\Windows\Start Menu\Programs\System Tools"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage2" /t reg_binary /v "CustomFolders" /d ^
160014001f7840f05f6481501b109f0800aa002f954e0000010007e1d90014001f50e04fd020ea3a6910a2d8^
08002b30309d19002f433a5c0000000000000000000000000000000000000056003100000000002c5aa9a3100057696e646f^
777300400009000400efbe7c5840392c5aa9a32e000000680100000000010000000000000000000000000000009797b30057^
0069006e0064006f00770073000000160054003100000000002e59a23e100045787472617300003e0009000400efbe2959b7^
332e59a23e2e000000f81100000000030000000000000000000000000000008e9d8000450078007400720061007300000016^
0000000100f6e8490214001f50e04fd020ea3a6910a2d808002b30309d19002f433a5c000000000000000000000000000000^
000000006000310000000000965a2015122050524f4752417e330000480009000400efbe595a4039965a23152e000000ca00^
00000000010000000000000000000000000000006d3f1301500072006f006700720061006d00440061007400610000001800^
5c00310000000000955ae00514204d4943524f537e310000440009000400efbe595a4039945a32a62e000000cb0000000000^
010000000000000000000000000000005831f7004d006900630072006f0073006f0066007400000018005600310000000000^
955a1006102057696e646f777300400009000400efbe595a4039945a32a62e000000f5000000000001000000000000000000^
000000000000b30ea400570069006e0064006f0077007300000016008600310000000000955a0906112053544152544d7e31^
00006e0009000400efbe595a4039945a32a62e0000000f010000000001000000000000000000440000000000b9f42b015300^
740061007200740020004d0065006e007500000040007300680065006c006c00330032002e0064006c006c002c002d003200^
3100370038003600000018008200310000000000965ae432112050726f6772616d7300006a0009000400efbe595a4039965a^
e4322e0000001001000000000100000000000000000040000000000031f35b00500072006f006700720061006d0073000000^
40007300680065006c006c00330032002e0064006c006c002c002d0032003100370038003200000018000000010038e1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /t reg_dword /v "HideFastUserSwitching" /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /t reg_dword /v "DisableLockWorkstation" /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /t reg_dword /v "ShowSleepOption" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "TaskbarAl" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "TaskbarGlomLevel" /d "3" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "TaskbarSmallIcons" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "ExtendedUIHoverTime" /d "80" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "TaskbarSd" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "ShowNotificationIcon" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t reg_dword /v "NoTrayContextMenu" /d "1" /f
:: startallback install
"Files\bin\StartAllBack.exe" /S
copy "Files\bin\start.svg" "C:\Program Files\StartAllBack\Orbs"
:: cuteborders
xcopy /y /i /q "Files\.cuteborders" "%userprofile%\.cuteborders"
start "" "%userprofile%\.cuteborders\cute-borders.exe"
:: nircmd_links
copy "Files\bin\nircmd.exe" "%windir%"
nircmd shortcut "%userprofile%\Pictures" "%appdata%\Microsoft\Windows\Network Shortcuts" "Pictures"
nircmd shortcut "%userprofile%\Downloads" "%appdata%\Microsoft\Windows\Network Shortcuts" "Downloads"
nircmd shortcut "%appdata%\Microsoft\Windows\Network Shortcuts" "%appdata%\Microsoft\Windows\Start Menu\Programs\System" "Shortcuts"
nircmd shortcut "%windir%\Extras\Hotkey\HotkeyP.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\System" "Hotkey"
nircmd shortcut "%windir%\Extras\WinRAR\WinRAR.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\System" "WinRAR" "" "%windir%\SystemResources\zipfldr.dll.mun"
nircmd shortcut "C:\Windows\Extras\Color\instanteyedropper.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\System" "Color"
nircmd shortcut "regedit.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs" "Registry"
:: контекстное меню
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "MaxUndoItems" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t reg_dword /v "NoNetConnectDisconnect" /d "1" /f
for %%a in (
{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}
{1d27f844-3a1f-4410-85ac-14651078412d}
{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}
{7AD84985-87B4-4a16-BE58-8B72A5B390F7}
{CA6CC9F1-867A-481E-951E-A28C5E4F01EA}
{b8cdcb65-b1bf-4b42-9428-1dfdb7ee92af}
{EE07CEF5-3441-4CFB-870A-4002C724783A}
{0bf754aa-c967-445c-ab3d-d8fda9bae7ef} ) do reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "%%~a" /f
for %%a in (
SystemFileAssociations\image\shell\print
batfile\shell\print
cmdfile\shell\print
docxfile\shell\print
htmlfile\shell\print
inifile\shell\print
regfile\shell\print
txtfile\shell\print
Folder\shell\pintohome
Folder\shell\opennewtab
Folder\shell\opennewprocess
Drive\shell\pintohome
batfile\shell\runas
cmdfile\shell\runas
exefile\shell\runas
batfile\shell\runasuser
cmdfile\shell\runasuser
exefile\shell\runasuser
CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage ) do reg add "HKCR\%%~a" /v "LegacyDisable" /f
reg add "HKCR\Folder\shell\opennewwindow" /v "Extended" /f
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /f
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" /f
reg delete "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /f
reg delete "HKLM\SOFTWARE\Classes\.bmp\ShellNew" /f
reg delete "HKLM\SOFTWARE\Classes\.zip\CompressedFolder\ShellNew" /f
reg delete "HKCR\DesktopBackground\Shell\cmd" /f
reg add "HKCU\Software\7-Zip\Options" /t reg_dword /v "ContextMenu" /d "4132" /f
reg add "HKLM\SOFTWARE\Classes\.bat\ShellNew" /t reg_sz /v "Filename" /d "" /f
reg add "HKLM\SOFTWARE\Classes\.bat\ShellNew" /t reg_expand_sz /v "ItemName" /d "@%SystemRoot%\System32\acppage.dll,-6002" /f
reg add "HKCR\batfile" /t reg_expand_sz /v "FriendlyTypeName" /d ".bat" /f
reg add "HKCR\txtfile" /t reg_expand_sz /v "FriendlyTypeName" /d ".txt" /f
reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPath" /ve /d "{f3d06e7c-1e45-4a26-847e-f9fcdee59be0}" /f
reg add "HKCR\Directory\background\shell\HiddenFiles" /v "MUIVerb" /d "Hide/Show" /f
reg add "HKCR\Directory\background\shell\HiddenFiles" /v "ExplorerCommandHandler" /d "{f7300245-1f4b-41ba-8948-6fd392064494}" /f
reg add "HKCR\Directory\background\shell\HiddenFiles" /v "Extended" /d "" /f
reg add "HKCR\Directory\background\shell\HiddenFiles" /v "CommandStateSync" /d "" /f
:: nilesoft shell
xcopy "Files\shell" "%windir%\Extras\Shell" /e /y /q /i & start "" "%windir%\Extras\Shell\shell.exe" -r
:: oldnewexplorer
reg add "HKCU\Software\Tihiy\OldNewExplorer" /t reg_dword /v "NoCaption" /d "1" /f
reg add "HKCU\Software\Tihiy\OldNewExplorer" /t reg_dword /v "NoIcon" /d "1" /f
reg add "HKCU\Software\Tihiy\OldNewExplorer" /t reg_dword /v "NoUpButton" /d "1" /f
cmd /c regsvr32 /s "%windir%\Extras\Shell\explorer\OldNewExplorer32.dll"
cmd /c regsvr32 /s "%windir%\Extras\Shell\explorer\OldNewExplorer64.dll"
:: hotkeys
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_expand_sz /v "DisabledHotkeys" /d "QSX" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /t reg_dword /v "ChatIcon" /d "3" /f
reg add "HKCU\Control Panel\Keyboard" /t reg_dword /v "PrintScreenKeyForSnippingEnabled" /d "0" /f
copy "Files\hotkey\restart.bat" "%windir%" & del "Files\hotkey\restart.bat"
xcopy "Files\hotkey" "%windir%\Extras\Hotkey" /e /y /q /i
reg add "HKCU\Software\Petr Lastovicka\hotkey" /t reg_dword /v "autoRun" /d "1" /f
reg add "HKCU\Software\Petr Lastovicka\hotkey" /t reg_dword /v "closeToTray" /d "1" /f
reg add "HKCU\Software\Petr Lastovicka\hotkey" /t reg_dword /v "trayicon" /d "0" /f
reg add "HKCU\Software\Petr Lastovicka\hotkey" /t reg_sz /v "file" /d "config.htk" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /t reg_sz /v "HotkeyP" /d "%windir%\Extras\hotkey\HotkeyP.exe 0" /f
:: система
schtasks /change /disable /tn "\StartAllBack Update"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /t reg_dword /v "ToastEnabled" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /t reg_dword /v "StartupDelayInMSec" /d "0" /f
reg add "HKCU\Control Panel\Desktop" /t reg_sz /v "MenuShowDelay" /d "100" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /t reg_dword /v "01" /d "0" /f
reg add "HKCU\Control Panel\Desktop" /t reg_sz /v "WindowArrangementActive" /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "EnableSnapBar" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t reg_dword /v "SnapAssist" /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /t reg_sz /v "TimeZoneKeyName" /d "N. Central Asia Standard Time" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /t reg_sz /v "Flags" /d "0" /f
reg add "HKCU\Control Panel\Mouse" /t reg_sz /v "MouseSensitivity" /d "8" /f
reg add "HKCU\Control Panel\Mouse" /t reg_sz /v "MouseSpeed" /d "0" /f
reg add "HKCU\Control Panel\Mouse" /t reg_sz /v "MouseThreshold1" /d "0" /f
reg add "HKCU\Control Panel\Mouse" /t reg_sz /v "MouseThreshold2" /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /t reg_dword /v "DisableSR" /d "1" /f
vssadmin delete shadows /all /quiet
sc config "Spooler" start=disabled
sc config "ShellHWDetection" start=disabled
sc config "NVDisplay.ContainerLocalSystem" start=disabled ) >nul 2>&1 & shutdown /r /t 0

:iconspatch
Files\Bin\icons_patch.exe & exit /b

:apps
:: screenx
( xcopy "Files\apps\ScreenX" "%windir%\Extras\ScreenX" /e /y /q /i
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_dword /v "ShowBubbles" /d "0" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_dword /v "Hotkey_main_vk" /d "83" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_dword /v "Hotkey_main_mod" /d "8" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_dword /v "Hotkey_savefull_mod" /d "4" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_dword /v "Hotkey_savefull_vk" /d "34" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_sz /v "Locale" /d "RU" /f
reg add "HKCU\Software\SkillBrains\Lightshot" /t reg_sz /v "LastSavedDir" /d "%userprofile%\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /t reg_sz /v "ScreenX" /d "%windir%\Extras\ScreenX\Lightshot.exe" /f
:: notepad++
xcopy "Files\apps\Notepad++" "%windir%\Extras\Notepad++" /e /y /q /i
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /t reg_sz /v "Debugger" /d "\"%windir%\Extras\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f
:: irfanview, mplayer, search, winrar
xcopy "Files\apps\IrfanView" "%windir%\Extras\IrfanView" /e /y /q /i
xcopy "Files\apps\MPlayer" "%windir%\Extras\MPlayer" /e /y /q /i
xcopy "Files\apps\Search" "%windir%\Extras\Search" /e /y /q /i
xcopy "Files\apps\WinRAR" "%windir%\Extras\WinRAR" /e /y /q /i
:: color
xcopy "Files\apps\Color" "%windir%\Extras\Color" /e /y /q /i
reg add "HKCU\Software\Instant Eyedropper" /t reg_sz /v "zoom" /d "3" /f
reg add "HKCU\Software\Instant Eyedropper" /t reg_sz /v "hotkeymods" /d "11" /f
reg add "HKCU\Software\Instant Eyedropper" /t reg_sz /v "hotkeyvk" /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /t reg_sz /v "Color" /d "%windir%\Extras\Color\instanteyedropper.exe" /f
:: volume2
xcopy "Files\apps\Volume2" "%windir%\Extras\Volume2" /e /y /q /i
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /t reg_sz /v "Volume2" /d "%windir%\Extras\Volume2\Volume2.exe" /f ) >nul 2>&1 & exit /b

:hostdisable
echo. [101;41mOpen notification center[0m & echo  Press any key & pause >nul 2>&1
if exist "%windir%\System32\RuntimeBroker.exe" ((
taskkill /f /im explorer.exe
taskkill /f /im RuntimeBroker.exe
taskkill /f /im ShellExperienceHost.exe
taskkill /f /im TextInputHost.exe
ren "%windir%\System32\RuntimeBroker.exe" "RuntimeBroker.exe.bak"
ren "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy" "ShellExperienceHost_cw5n1h2txyewy.bak"
ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exe.bak"
start explorer.exe ) >nul 2>&1 & exit /b
) else ((
taskkill /f /im explorer.exe
ren "%windir%\System32\RuntimeBroker.exe.bak" "RuntimeBroker.exe"
ren "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.bak" "ShellExperienceHost_cw5n1h2txyewy"
ren "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe.bak" "TextInputHost.exe"
start RuntimeBroker.exe
start explorer.exe ) >nul 2>&1 & exit /b )

:activation
echo. & echo. Activation...
set "act=cscript /nologo "%windir%\System32\slmgr.vbs" //b"
%act% /ipk "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" & %act% /skms kms.digiboy.ir & %act% /ato & exit /b

:chocolatey
( powershell -ExecutionPolicy ByPass -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" ) >nul 2>&1

:chocoinstall
:: puntoswitcher
( mkdir "%appdata%\Yandex\Punto Switcher\User Data"
copy "Files\bin\preferences.xml" "%appdata%\Yandex\Punto Switcher\User Data\preferences.xml" ) >nul 2>&1
:: chocoinstall
call "Files\bin\choco.bat"
:: onlyoffice
( reg delete "HKCR\.docx\ASC.Document.12\ShellNew" /f
reg delete "HKCR\.pdf\ASC.Pdf\ShellNew" /f
reg delete "HKCR\.xlsx\ASC.Sheet.12\ShellNew" /f
reg delete "HKCR\.pptx\ASC.Show.12\ShellNew" /f
sc config "ONLYOFFICE Update Service" start=disabled
:: firefox
set folder=%appdata%\Mozilla\Firefox\Profiles
for /f %%i in ( ' dir /a:d/b "%folder%" ' ) do if exist "%folder%\%%i\." xcopy /e /y /q /i "Files\firefox\chrome" "%folder%\%%i\chrome"
for /f %%i in ( ' dir /a:d/b "%folder%" ' ) do if exist "%folder%\%%i\." copy "Files\firefox\user.js" "%folder%\%%i\"
:: taskbar-start
reg add "HKCU\Control Panel\NotifyIconSettings\12844384150153061454" /v "IconSnapshot" /t reg_binary /d ^
89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000000017352474200aece1ce9^
0000000467414d410000b18f0bfc6105000000d749444154384fc593310e8240104589090d8531b1a1b1b6d082d^
a46121b1beec011bc991eca3358eefaff30b38e012468e14b26fb7776feeeb040f617420827c4927a2119478cb145^
449d8e7147ec3be93033d1540227364897d41873cccfd68580a499073b40f186262ce53adf3168f4b45ca4e04824^
1b63adba1253a74be8c35bb1e17328ba20aeaad78823354a0ae8667203c8959f8b49a1eebd85b94c6e80c379a93^
76a3e028687e60b8ed2ae63ec122bd5fd4b3490f8ee357acc4c349540f1e70fc9c0e260071e18b78857fb738139fd4c3f92654f12a922d39e0909960000000049454e44ae426082 /f
reg add "HKCU\Control Panel\NotifyIconSettings\12844384150153061454" /v "UID" /t reg_dword /d "1" /f
reg add "HKCU\Control Panel\NotifyIconSettings\12844384150153061454" /v "InitialTooltip" /t reg_sz /d "" /f
reg add "HKCU\Control Panel\NotifyIconSettings\12844384150153061454" /v "ExecutablePath" /t reg_sz /d "{F38BF404-1D43-42F2-9305-67DE0B28FC23}\Extras\Volume2\Volume2.exe" /f
reg add "HKCU\Control Panel\NotifyIconSettings\12844384150153061454" /v "IsPromoted" /t reg_dword /d "1" /f
reg add "HKCU\Control Panel\NotifyIconSettings\13819209909520068858" /v "IconSnapshot" /t reg_binary /d ^
89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000000017352474200aece1ce9^
0000000467414d410000b18f0bfc61050000012a49444154384fd5524b6a024114ac4eb292acdc6621c15d4ee23^
1928560b682a7c83172038fe00502825b032e440841228a4c774fbfbcea8f0ea307481e1455fd3e35dd3d8dff1fe6^
7010c93a474008592987b860ee125e4bd1a0d34903d2f04a524e39721b9bcd1e37b1aac14489a4cf8dd7bece20^
9bc1406434126cb769cb752d0a6ab2c0fb4b26ba5d83f1f807464764323158ad908a0e70cace25587b9d7b3d83^
d96c978ee0bd0ee581023636876c23477086971b0dcad662536e2c835595d816ce609d0666aab7f5f4fa86e3e71^
a416dc57a04a7b02eb173a88bd65aadeba09774fff880e9c73b4ca506b7c321c272c97340086b138a2e798297e4^
6b987e1fdff339cc510dee9e5f62810d2c9e741cd05d1526f88b32be160b7d486a90deda198c76ae8dbf12c02f374580d4be90c8870000000049454e44ae426082 /f
reg add "HKCU\Control Panel\NotifyIconSettings\13819209909520068858" /v "UID" /t reg_dword /d "0" /f
reg add "HKCU\Control Panel\NotifyIconSettings\13819209909520068858" /v "ExecutablePath" /t reg_sz /d "{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}\Yandex\Punto Switcher\punto.exe" /f
reg add "HKCU\Control Panel\NotifyIconSettings\13819209909520068858" /v "IsPromoted" /t reg_dword /d "1" /f
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ONLYOFFICE"
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\qBittorrent"
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Яндекс"
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk"
attrib +h "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Приватный просмотр Firefox.lnk"
nircmd shortcut "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\qBittorrent\qBittorrent.lnk" "%appdata%\Microsoft\Windows\Start Menu\Programs" "qBittorrent"
nircmd shortcut "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ONLYOFFICE\ONLYOFFICE.lnk" "%appdata%\Microsoft\Windows\Start Menu\Programs" "Office" ) >nul 2>&1 & exit /b
