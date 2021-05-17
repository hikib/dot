
New-Item -ItemType SymbolicLink -Path "$home\.vimrc" -Target "$PSScriptRoot\vimrc" -Force

$vimplug = "$home\.vim\autoload\plug.vim"
$plug_exists = Test-Path -LiteralPath $vimplug -PathType Leaf

if (-not $plug_exists) {
  Write-Host "Vim-Plug does not exist! Curling vim-plug... "
  $vimpluggit = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  curl -fLo "$vimplug" --create-dirs $vimpluggit
}

Read-Host -Prompt "Press Enter to exit"

