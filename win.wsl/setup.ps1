# WSL settings
$SETTINGSPATH = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
New-Item -ItemType SymbolicLink -Path "$SETTINGSPATH\settings.json" -Target "$PSScriptRoot\wsl\settings.json" -Force
