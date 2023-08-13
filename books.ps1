. "$($env:DotConfigPath)/powershell/settings.ps1"

$option = $(fd --base-directory $BooksFolderPath | fzf) -replace '\\','/'
if ($option) { Set-Process "$BooksFolderPath/$option" }
