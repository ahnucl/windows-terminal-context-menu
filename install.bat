rem Copies dependencies to "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu"
mkdir "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu"
copy "dependencies\helper.exe" "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu"
copy "dependencies\terminal.ico" "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu"

rem Adds "Open Terminal window here" to the background context menu
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal" /v Icon /t REG_SZ /d "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu\terminal.ico"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal" /v MUIVerb /t REG_SZ /d "Open Terminal window here"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal\command" /t REG_SZ /d "\"%LocalAppData%\Microsoft\WindowsApps\wt.exe\" -d \"%%V\""

rem Adds "Open elevated Terminal window here" to the background context menu
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" /v HasLUAShield /t REG_SZ
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" /v Icon /t REG_SZ /d "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu\terminal.ico"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" /v MUIVerb /t REG_SZ /d "Open elevated Terminal window here"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated\command" /t REG_SZ /d "\"%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu/helper.exe\" \"%%V\""

rem Adds "Open Terminal window here" to the directory context menu
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal" /v Icon /t REG_SZ /d "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu\terminal.ico"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal" /v MUIVerb /t REG_SZ /d "Open Terminal window here"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal\command" /t REG_SZ /d "\"%LocalAppData%\Microsoft\WindowsApps\wt.exe\" -d \"%%V\""

rem Adds "Open elevated Terminal window here" to the directory context menu
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" /v HasLUAShield /t REG_SZ
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" /v Icon /t REG_SZ /d "%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu\terminal.ico"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" /v MUIVerb /t REG_SZ /d "Open elevated Terminal window here"
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\shell\windows-terminal-elevated\command" /t REG_SZ /d "\"%LocalAppData%\Microsoft\WindowsApps\windows-terminal-context-menu/helper.exe\" \"%%V\""
exit
