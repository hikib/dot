# --- TERMINAL
Set-PSReadlineOption -EditMode vi
function prompt {
  # username.computername currdirectory.gitbranch $
  # hiko.nep dot.main $
  $realLASTEXITCODE = $LASTEXITCODE

  Write-Host "$env:username".ToLower() -ForegroundColor Gray -NoNewline
  Write-Host ".$env:computername ".ToLower() -ForegroundColor DarkYellow -NoNewline
  Write-Host $(Get-Item -Path $(Get-Location)).BaseName.ToLower() -ForegroundColor Gray -NoNewline
  if ($GITBRANCH = git branch --show-current 2> $null) {
    Write-Host ".$GITBRANCH"  -ForegroundColor DarkYellow -NoNewline
    # Show number of issues
    # TOO SLOW !
    # if ($ISSUES = gh issue list | Measure-Object -Line | Select-Object -ExpandProperty Lines 2> $null) {
    #   Write-Host " ($ISSUES)"  -ForegroundColor Red -NoNewline
    # }
  }
  Write-Host ""
  Write-Host "$" -ForegroundColor DarkRed -NoNewline

  $global:LASTEXITCODE = $realLASTEXITCODE
  Return " "
}

# --- SCRIPTS
$env:Path += ";${env:userprofile}\.local\bin"

# --- ALIAS
Set-Alias -Name k -Value clear
