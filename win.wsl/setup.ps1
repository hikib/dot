# Windows Terminal settings
$SETTINGSPATH = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
New-Item -ItemType SymbolicLink -Path "$SETTINGSPATH\settings.json" -Target "$PSScriptRoot\settings.json" -Force
