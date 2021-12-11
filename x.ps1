$options = (
    "git log",
    "git diff",
    "git pull",
    "git push",
    "git blame",
    "git commit",
    "git revert",
    "git log on current file",
    "git diff with prev version",

    "svn log",
    "svn diff",
    "svn pull",
    "svn update",
    "svn commit")

switch ($($options -join "`n" | fzf)) {
    "git log"                    { TortoiseGitProc.exe -path . -command log }
    "git diff"                   { TortoiseGitProc.exe -path . -command diff }
    "git pull"                   { TortoiseGitProc.exe -path . -command pull }
    "git push"                   { TortoiseGitProc.exe -path . -command push }
    "git blame"                  { TortoiseGitProc.exe -path $($args[0]) -command blame }
    "git commit"                 { TortoiseGitProc.exe -path . -command commit }
    "git revert"                 { TortoiseGitProc.exe -path . -command revert }
    "git log on current file"    { TortoiseGitProc.exe -path $($args[0]) -command log }
    "git diff with prev version" { TortoiseGitProc.exe -command showcompare -revision1 HEAD^ -revision2 HEAD }

    "svn log"                 { TortoiseProc.exe -path . -command:log }
    "svn diff"                { TortoiseProc.exe -path . -command:diff }
    "svn pull"                { TortoiseProc.exe -path . -command:pull }
    "svn update"              { TortoiseProc.exe -path . -command:update }
    "svn commit"              { TortoiseProc.exe -path . -command:commit }
}
