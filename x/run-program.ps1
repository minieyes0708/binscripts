@{
    "description" = "run program"
    "scriptblock" = { Get-Content $env:DotConfig/programs.txt | fzf | ForEach-Object { Invoke-Expression $_ } }
}
