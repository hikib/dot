$SETTINGSPATH = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
Rename-Item -Path $SETTINGSPATH\settings.json -NewName $SETTINGSPATH\settings.json.backup
New-Item -ItemType SymbolicLink -Path "$SETTINGSPATH\settings.json" -Target "$PSScriptRoot\settings.json" -Force
Read-Host -Prompt "Press Enter to exit"

