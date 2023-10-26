# ---- ALIASES
Set-Alias -Name k -Value clear
Set-Alias -Name vi -Value nvim
Set-Alias -Name ff -Value firefox

# ---- SCRIPTS
$env:Path += ";${env:userprofile}\.local\bin"
$env:Path += ";C:\msys64\mingw64\bin"
$env:Path += ";C:\lua-language-server\bin"
$env:MOME = "C:\Users\Hiko\repos\github.com\hikib\mome\docs"
$env:EDITOR = "nvim"

# ---- TERMINAL
Set-PSReadlineOption -EditMode vi
Set-Location "${env:userprofile}/repos/github.com/hikib/"

function prompt {
  # format:
  # username.computername currDirectory.gitBranch $
  # example:
  # hiko.nep dot.main $

  $realLASTEXITCODE = $LASTEXITCODE

  # $currDirectory = $(Get-Item -Path $(Get-Location)).BaseName.ToLower() # current directory name only
  $currDirectory = $($executionContext.SessionState.Path.CurrentLocation).ToString().Replace($env:userprofile, '~')
  $hasGitBranch = $gitBranch = git branch --show-current 2> $null # assigns "git branch..." to $gitBranch

  Write-Host "$env:username".ToLower() -ForegroundColor Gray -NoNewline
  Write-Host ".$env:computername".ToLower() -ForegroundColor DarkYellow -NoNewline
  Write-Host " $currDirectory" -ForegroundColor Gray -NoNewline
  if ($hasGitBranch) {
    Write-Host ".$gitBranch"  -ForegroundColor DarkYellow -NoNewline
  }
  Write-Host ""
  Write-Host "$" -ForegroundColor DarkRed -NoNewline

  $global:LASTEXITCODE = $realLASTEXITCODE
  Return " "
}

