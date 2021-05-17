$SETTINGSPATH = "$env:APPDATA\Code\User"
Rename-Item -Path $SETTINGSPATH\settings.json -NewName $SETTINGSPATH\settings.json.backup
New-Item -ItemType SymbolicLink -Path "$SETTINGSPATH\settings.json" -Target "$PSScriptRoot\settings.json" -Force
Read-Host -Prompt "Press Enter to exit"

