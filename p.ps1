$option = $(Get-Content ~/.bashrc.d/user/programs.txt | fzf)
cmd /c $option
