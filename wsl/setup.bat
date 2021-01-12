@echo on
set SETTINGSPATH=%userprofile%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
rename %SETTINGSPATH%\settings.json settings.json.backup
mklink %SETTINGSPATH%\settings.json %~dp0settings.json
pause
exit
