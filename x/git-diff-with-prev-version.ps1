@{
    "description" = "git diff with prev version"
    "scriptblock" = { TortoiseGitProc.exe -command showcompare -revision1 HEAD^ -revision2 HEAD }
}
