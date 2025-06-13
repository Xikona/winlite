menu(where=@(this.count == 0) type='taskbar' expanded=true)
{
	item(title='Regedit' image cmd='regedit.exe')
	item(title='Control' image='shell32.dll,-137' cmd='control')
	menu(title='System' image=\uE1FB)
	{
	item(title='Services' image='filemgmt.dll' cmd='services.msc')
	item(title='Taskschd' image='miguiresource.dll,-600' cmd='taskschd.msc')
	item(title='Service' image='shell32.dll,-153' cmd='%windir%\Extras\Service.bat')
	item(title='Tweaker' image cmd='%windir%\Extras\Win 10 Tweaker.exe')
	}
	item(title='Notepad++' image cmd='%windir%\Extras\Notepad++\notepad++.exe')
	item(title='Extras' image='imageres.dll,-4' cmd='%windir%\Extras')
}