# Set up vim on WIN
# Requires git-bash, therefore under uni.vim

$vrc = "$home\.vimrc"
if (Test-Path -LiteralPath $vrc -PathType Leaf) { Remove-Item $vrc }
# cmd /c mklink $vrc "$PSScriptRoot\vimrc"
New-Item -ItemType SymbolicLink `
  -Path $vrc `
  -Target "$PSScriptRoot\vimrc" `
  -Force

$vimdir =  "$home\.vim"
$vimdir_exists = Test-Path -LiteralPath $vimdir -PathType Container
if ( -not $vimrdir_exists ) {
  New-Item `
    -ItemType Directory `
    -Path $vimdir
}

$DOTFILES = "after", `
            "colors", `
            "ftdetect.vim", `
            "ftplugin", `
            "functions.vim", `
            "mappings.vim", `
            "spell"
foreach ($DOTFILE in $DOTFILES)
{
  $df = "$home\.vim\$DOTFILE"
  if (Test-Path -LiteralPath $df -PathType Leaf) {
    Remove-Item -Path $df -force
    cmd /c mklink $df "$PSScriptRoot\vim\$DOTFILE"
  } else {
    Remove-Item -Path $df -recurse -force
    cmd /c mklink /d $df "$PSScriptRoot\vim\$DOTFILE"
  }
}

$vimplug = "$home\.vim\autoload\plug.vim"
$plug_exists = Test-Path -LiteralPath $vimplug -PathType Leaf
if ( -not $plug_exists ) {
  Write-Host "Vim-Plug does not exist! Curling vim-plug... "
  $vimpluggit = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  curl -fLo "$vimplug" --create-dirs $vimpluggit
}
Read-host "Press Enter"
