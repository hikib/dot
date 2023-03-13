# Set up bash on WIN
# Requires git-bash, therefore under uni.bash

$files = @("minttyrc", "bash_aliases", "dir_colors", "bashrc", "bash_profile")
foreach ($file in $files) {
  $rc = "$home\.$file"
  if (Test-Path -LiteralPath $rc -PathType Leaf) { Remove-Item $rc }
  New-Item -ItemType SymbolicLink `
    -Path $rc `
    -Target "$PSScriptRoot\$file" `
    -Force
}

Read-host "Press Enter"
