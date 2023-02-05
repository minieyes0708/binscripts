$option = $(Get-Content $env:ProgramLists | fzf)
cmd /c $option
