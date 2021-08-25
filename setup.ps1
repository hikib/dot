$dotfiles = @("vim", "tmux" ,"bash" ,"snip")
foreach ($directory in $dotfiles) {
    & $directory/setup.ps1
}

Read-Host -Prompt "Press Enter to exit"

