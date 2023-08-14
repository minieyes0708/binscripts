. "$($env:DotConfigPath)/powershell/settings.ps1"

$option = $(fd --base-directory $BooksFolderPath | fzf) -replace '\\','/'
if ($option) { Start-Process "$BooksFolderPath/$option" }
