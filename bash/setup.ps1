$files = @("minttyrc", "bash_aliases", "dir_colors", "bashrc", "bash_profile")
foreach ($file in $files) {
  New-Item -ItemType SymbolicLink -Path "$home\.$file" -Target "$PSScriptRoot\$file" -Force
}
Read-Host -Prompt "Press Enter to exit"
