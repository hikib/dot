@echo on
set SETTINGSPATH=%APPDATA%\Code\User
rename %SETTINGSPATH%\settings.json settings.json.backup
mklink %SETTINGSPATH%\settings.json %~dp0settings.json
pause
exit
