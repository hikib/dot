$profileLocation = Split-Path $PROFILE.CurrentUserCurrentHost
New-Item -ItemType SymbolicLink -Path "$profileLocation\profile.ps1" -Target "$PSScriptRoot\posh\profile.ps1" -Force

Read-Host -Prompt "Press Enter to exit"
