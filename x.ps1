$options = @(
    "git log",`
    "git diff",`
    "git pull",`
    "git push",`
    "git blame",`
    "git commit",`
    "git revert",`
    "git log on current file",`
    "git diff with prev version",`

    "svn log",`
    "svn diff",`
    "svn pull",`
    "svn update",`
    "svn commit")

switch ($($options | fzf)) {
    "git log"                    { TortoiseGitProc.exe -command log }
    "git diff"                   { TortoiseGitProc.exe -command diff }
    "git pull"                   { TortoiseGitProc.exe -command pull }
    "git push"                   { TortoiseGitProc.exe -command push }
    "git blame"                  { TortoiseGitProc.exe -command blame -path $args }
    "git commit"                 { TortoiseGitProc.exe -command commit }
    "git revert"                 { TortoiseGitProc.exe -command revert }
    "git log on current file"    { TortoiseGitProc.exe -command log -path $args }
    "git diff with prev version" { TortoiseGitProc.exe -command showcompare -revision1 HEAD^ -revision2 HEAD }

    "svn log"                    { TortoiseProc.exe -path "." -command:log }
    "svn diff"                   { TortoiseProc.exe -path "." -command:diff }
    "svn pull"                   { TortoiseProc.exe -path "." -command:pull }
    "svn update"                 { TortoiseProc.exe -path "." -command:update }
    "svn commit"                 { TortoiseProc.exe -path "." -command:commit }
}
