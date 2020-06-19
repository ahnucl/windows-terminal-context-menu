; Include Modern UI
!include "MUI2.nsh"

; General
Name "windows-terminal-context-menu"
OutFile "windows-terminal-context-menu.exe"
Unicode True
InstallDir "$LOCALAPPDATA\Programs\windows-terminal-context-menu"
InstallDirRegKey HKCU "Software\windows-terminal-context-menu" "Install_Dir"
RequestExecutionLevel user

; Interface Settings
!define MUI_ABORTWARNING
!define MUI_ICON "dependencies\terminal.ico"
!define MUI_UNICON "dependencies\terminal.ico"

; Pages
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
  
; Languages
!insertmacro MUI_LANGUAGE "English"

; Sections
Section
retry:
ClearErrors
EnumRegKey $0 HKCU "Software\windows-terminal-context-menu" 0
IfErrors 0 keyexist
Goto continue
keyexist:
Goto alert
alert:
MessageBox MB_RETRYCANCEL "windows-terminal-context-menu is already installed, please uninstall any previous versions before continuing." IDRETRY retry IDCANCEL abort
abort:
Abort
continue:
SectionEnd

Section "Install"
SetOutPath "$INSTDIR"
File "dependencies\helper.exe"
File "dependencies\terminal.ico"
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal" "Icon" '"$INSTDIR\terminal.ico"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal" "MUIVerb" "Open Terminal window here"
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal\command" "" '"$LOCALAPPDATA\Microsoft\WindowsApps\wt.exe" -d "%V"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" "HasLUAShield" ""
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" "Icon" '"$INSTDIR\terminal.ico"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated" "MUIVerb" "Open elevated Terminal window here"
WriteRegStr HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated\command" "" '"$INSTDIR\helper.exe" "%V"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal" "Icon" '"$INSTDIR\terminal.ico"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal" "MUIVerb" "Open Terminal window here"
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal\command" "" '"$LOCALAPPDATA\Microsoft\WindowsApps\wt.exe" -d "%V"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" "HasLUAShield" ""
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" "Icon" '"$INSTDIR\terminal.ico"'
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal-elevated" "MUIVerb" "Open elevated Terminal window here"
WriteRegStr HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal-elevated\command" "" '"$INSTDIR\helper.exe" "%V"'
WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "DisplayName" "windows-terminal-context-menu"
WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "UninstallString" '"$INSTDIR\uninstall.exe"'
WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "DisplayIcon" '$INSTDIR\uninstall.exe,0'
WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "DisplayVersion" "v1.1"
WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "NoModify" 1
WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu" "NoRepair" 1
WriteRegStr HKCU "SOFTWARE\windows-terminal-context-menu" "Install_Dir" "$INSTDIR"
WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
DeleteRegKey HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal"
DeleteRegKey HKCU "SOFTWARE\Classes\Directory\Background\shell\windows-terminal-elevated"
DeleteRegKey HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal"
DeleteRegKey HKCU "SOFTWARE\Classes\Directory\shell\windows-terminal-elevated"
DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\windows-terminal-context-menu"
DeleteRegKey HKCU SOFTWARE\windows-terminal-context-menu
Delete $INSTDIR\helper.exe
Delete $INSTDIR\terminal.ico
Delete "$INSTDIR\uninstall.exe"
RMDir "$INSTDIR"
SectionEnd
