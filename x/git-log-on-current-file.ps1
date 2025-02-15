@{
    "description" = "git log on current file"
    "scriptblock" = { TortoiseGitProc.exe -path $($args[0]) -command log }
}
