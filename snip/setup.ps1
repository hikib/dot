
New-Item -ItemType SymbolicLink -Path "$home\.snippets" -Target "$PSScriptRoot\snippets" -Force

Read-Host -Prompt "Press Enter to exit"

