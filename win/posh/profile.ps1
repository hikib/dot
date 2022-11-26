# shorthand for temp work
function runInContainer {podman run --rm -h pluto -v ./:/home/x -it hikib/pluto}
Set-Alias -Name dev -Value runInContainer

# --- SCRIPTS
$env:Path += ";${env:HOMEPATH}\.local\bin}"

# --- UNIX LIKE
# From https://github.com/mikemaccana/powershell-profile

# From https://github.com/Pscx/Pscx
function sudo(){
	Invoke-Elevated @args
}

# Truncate homedir to ~
function limit-HomeDirectory($Path) {
  $Path.Replace("$home", "~")
}

# Must be called 'prompt' to be used by pwsh
# https://github.com/gummesson/kapow/blob/master/themes/bashlet.ps1
function prompt {
  $realLASTEXITCODE = $LASTEXITCODE
  Write-Host $(limit-HomeDirectory("$pwd")) -ForegroundColor Yellow -NoNewline
  Write-Host " $" -NoNewline
  $global:LASTEXITCODE = $realLASTEXITCODE
  Return " "
}
