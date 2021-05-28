$files = @("minttyrc", "bash_profile", "bash_aliases", "dir_colors", "bashrc")
foreach ($file in $files) {
  New-Item -ItemType SymbolicLink -Path "$home\.$file" -Target "$PSScriptRoot\$file" -Force
}
Read-Host -Prompt "Press Enter to exit"
