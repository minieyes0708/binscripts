$ErrorActionPreference = "Stop"

Push-Location (Join-Path $PSScriptRoot x)
$filename = Resolve-Path $(fzf)
Pop-Location

& "$filename"
