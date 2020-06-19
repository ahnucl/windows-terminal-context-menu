rem Deletes dependencies folder located in "%LocalAppData%\Microsoft\WindowsApps\windows_terminal_context_menu"
rmdir /s /q "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu"

rem Removes "Open Windows Terminal here" from the background context menu
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal" /f

rem Removes "Open elevated Windows Terminal here" from the background context menu
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" /f

rem Removes "Open Windows Terminal here" from the directory context menu
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal" /f

rem Removes "Open elevated Windows Terminal here" from the directory context menu
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" /f
exit
