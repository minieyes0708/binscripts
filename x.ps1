$ErrorActionPreference = "Stop"

$xpath = Join-Path $env:BinScriptPath 'x'
$filename = Join-Path $xpath $((Get-ChildItem $xpath).Name | fzf --height=40% --border --margin=5,10 --preview="bat --color=always $($env:BinScriptPath)/x/{}")

& "$filename"
