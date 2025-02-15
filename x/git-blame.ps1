@{
    "description" = "git blame"
    "scriptblock" = { TortoiseGitProc.exe -path $($args[0]) -command blame }
}
