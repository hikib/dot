# ---- ALIASES
Set-Alias -Name k -Value clear
Set-Alias -Name vi -Value nvim

# ---- SCRIPTS
Set-Alias -Name ff -Value firefox
Set-Alias -Name yt -Value youtube

# ---- ENVIRONMENT VARIABLES
$env:BROWSER = "$env:ProgramFiles\Mozilla Firefox\firefox.exe"
$env:EDITOR = "nvim"
$env:MOME = "$env:userprofile\repos\github.com\hikib\mome\docs"

# ---- PATH ADDITIONS
$env:Path += ";${env:userprofile}\.local\bin" # my scripts
$env:Path += ";C:\lua-language-server\bin" # nvim
$env:Path += ";C:\msys64\mingw64\bin" # git-bash

# ---- TERMINAL
Set-PSReadlineOption -EditMode vi
Set-Location "$env:userprofile/repos/github.com/hikib/"

function prompt
{
    # format:
    # username.computername currDirectory.gitBranch $
    #
    # example:
    # hiko.nep dot.main $

    $realLASTEXITCODE = $LASTEXITCODE
    $currDirectory = $($executionContext.SessionState.Path.CurrentLocation).ToString().Replace($env:userprofile, '~')
    $hasGitBranch = $gitBranch = git branch --show-current 2> $null

    Write-Host "$env:username".ToLower() -ForegroundColor Gray -NoNewline
    Write-Host ".$env:computername".ToLower() -ForegroundColor DarkYellow -NoNewline
    Write-Host " $currDirectory" -ForegroundColor Gray -NoNewline
    if ($hasGitBranch)
    {
        Write-Host ".$gitBranch"  -ForegroundColor DarkYellow -NoNewline
    }
    Write-Host ""
    Write-Host "$" -ForegroundColor DarkRed -NoNewline

    $global:LASTEXITCODE = $realLASTEXITCODE
    Return " "
}

