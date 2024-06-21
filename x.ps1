$commands = @{
    "git log"                    = { TortoiseGitProc.exe -path . -command log }
    "git diff"                   = { TortoiseGitProc.exe -path . -command diff }
    "git pull"                   = { TortoiseGitProc.exe -path . -command pull }
    "git push"                   = { TortoiseGitProc.exe -path . -command push }
    "git blame"                  = { TortoiseGitProc.exe -path $($args[0]) -command blame }
    "git commit"                 = { TortoiseGitProc.exe -path . -command commit }
    "git revert"                 = { TortoiseGitProc.exe -path . -command revert }
    "git log on current file"    = { TortoiseGitProc.exe -path $($args[0]) -command log }
    "git diff with prev version" = { TortoiseGitProc.exe -command showcompare -revision1 HEAD^ -revision2 HEAD }

    "svn log"                    = { TortoiseProc.exe -path . -command:log }
    "svn diff"                   = { TortoiseProc.exe -path . -command:diff }
    "svn pull"                   = { TortoiseProc.exe -path . -command:pull }
    "svn update"                 = { TortoiseProc.exe -path . -command:update }
    "svn commit"                 = { TortoiseProc.exe -path . -command:commit }

    "add bookmark"               = { "`n" + (get-location).path | out-file -append $env:dotconfig\bookmarks.txt }
}
$commands[($commands.Keys -join "`n" | fzf)].Invoke()