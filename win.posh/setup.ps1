# Powershell Profile
$profileLocation = Split-Path $PROFILE.CurrentUserCurrentHost
New-Item -ItemType SymbolicLink -Path "$profileLocation\profile.ps1" -Target "$PSScriptRoot\profile.ps1" -Force
