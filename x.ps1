$arg0 = $args[0]
$CmdCommand = { param($arg) if ($arg) {cmd /c $arg} }
$StartCommand = { param($arg) if($arg) {Start-Process $arg} }
$SetLocationCommand = { param($arg) if($arg) {Set-Location $arg} }
$SetClipboardCommand = { param($arg) if($arg) {Set-Clipboard $arg} }
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

    "start file"                 = { Select-UsingFZF $StartCommand (es $arg0) }
    "run program"                = { Select-UsingFZF $CmdCommand (Get-Content $env:DotConfig/programs.txt) }

    "add bin script"             = { code -r "$BinScriptPath\$(Read-Host "Script Name: ").ps1" }

    "add bookmark"               = { "`n" + (get-location).path | out-file -append $env:dotconfig\bookmarks.txt }
    "open bookmark"              = { Select-UsingFZF $StartCommand (Get-Content $env:DotConfig/bookmarks.txt) }
    "goto bookmark"              = { Select-UsingFZF $SetLocationCommand (Get-Content $env:DotConfig/bookmarks.txt) }
    "copy bookmark"              = { Select-UsingFZF $SetClipboardCommand (Get-Content $env:DotConfig/bookmarks.txt) }
    "select bookmark"            = { Select-UsingFZF $SetLocationCommand (Get-Content $env:DotConfig/bookmarks.txt) }

    "change folder permissions"  = { cmd /c takeown /F %1 /R /D Y; cmd /c icacls %1 /grant:r (Read-Host "User Acount: "):F /T }
}

$key = $commands.Keys -join "`n" | fzf
if ($key) { Invoke-Command -ScriptBlock $commands[$key] }