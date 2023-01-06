New-Item -ItemType SymbolicLink -Path "$home\.tmux.conf" -Target "$PSScriptRoot\tmux.conf" -Force

Read-Host -Prompt "Press Enter to exit"

