Push-Location (Join-Path $PSScriptRoot x)
&".\$(fzf)"
Pop-Location
