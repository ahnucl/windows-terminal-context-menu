#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoTrayIcon

path := A_Args[1]
EnvGet, LocalAppData, LocalAppData
Run, *RunAs %LocalAppData%\Microsoft\WindowsApps\wt.exe -d "%path%"
ExitApp