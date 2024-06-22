$SetLocationCommand = { param($path) if($path) {Set-Location $path} }
$SetClipboardCommand = { param($path) if($path) {Set-Clipboard $path} }
function Select-UsingFZF {
    param (
        $cmdlet,
        $content
    )
    Invoke-Command -ScriptBlock $cmdlet -ArgumentList ($content | fzf)
}
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

    "add path"                   = { $global:PATHS = @((Get-Location).Path) }
    "select path"                = { Select-UsingFZF $SetLocationCommand $global:PATHS }

    "add bookmark"               = { "`n" + (get-location).path | out-file -append $env:dotconfig\bookmarks.txt }
    "goto bookmark"              = { Select-UsingFZF $SetLocationCommand (Get-Content $env:DotConfig/bookmarks.txt) }
    "copy bookmark"              = { Select-UsingFZF $SetClipboardCommand (Get-Content $env:DotConfig/bookmarks.txt) }
    "select bookmark"            = { Select-UsingFZF $SetLocationCommand (Get-Content $env:DotConfig/bookmarks.txt) }
}
Invoke-Command -ScriptBlock $commands[($commands.Keys -join "`n" | fzf)]