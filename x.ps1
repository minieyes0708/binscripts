$ErrorActionPreference = "Stop"

$xpath = Join-Path $env:BinScriptPath 'x'
$filename = Join-Path $xpath $((Get-ChildItem $xpath).Name | fzf)

& "$filename"
