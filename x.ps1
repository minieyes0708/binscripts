param (
    $subcommand
)

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
    "select path"                = { $global:PATHS | fzf | ForEach-Object { Set-Location $_ } }
    "goto subdirectory"          = { fd -t d -d 3 $args | fzf | ForEach-Object { Set-Location $_ } }

    "start file"                 = { es $args | fzf | ForEach-Object { Start-Process $_ } }
    "run program"                = { Get-Content $env:DotConfig/programs.txt | fzf | ForEach-Object { Start-Process $_ } }
    "edit program"               = { code -r $env:DotConfig/programs.txt }

    "add bin script"             = { code -r "$PSScriptRoot\$(Read-Host "Script Name").ps1" }

    "add bookmark"               = { "`n" + (get-location).path | out-file -append $env:dotconfig\bookmarks.txt }
    "edit bookmark"              = { code -r $env:DotConfig/bookmarks.txt }
    "open bookmark"              = { Get-Content $env:DotConfig/bookmarks.txt | fzf | ForEach-Object { Start-Process $_ } }
    "goto bookmark"              = { Get-Content $env:DotConfig/bookmarks.txt | fzf | ForEach-Object { Set-Location $_ } }
    "copy bookmark"              = { Get-Content $env:DotConfig/bookmarks.txt | fzf | ForEach-Object { Set-Clipboard $_ } }
    "select bookmark"            = { Get-Content $env:DotConfig/bookmarks.txt | fzf | ForEach-Object { Set-Location $_ } }

    "search dictionary"          = {
        $url = "https://tw.dictionary.search.yahoo.com/search?p=$(Read-Host "Search Text")"
        $request = Invoke-WebRequest -Uri $url -UseBasicParsing
        $HTML = New-Object -Com 'HTMLFile'
        [string]$htmlBody = $request.Content
        $HTML.write([ref]$htmlBody)
        Write-Host $HTML.getElementsByClassName('grp-main')[0].innerText
    }
    "change folder permissions"  = { cmd /c takeown /F %1 /R /D Y; cmd /c icacls %1 /grant:r (Read-Host "User Acount"):F /T }
}

if ($subcommand) {
    $arguments = $args
    switch ($subcommand) {
        "sf"   { Invoke-Command -ScriptBlock $($commands["start file"]) -ArgumentList $arguments }
        "gb"   { Invoke-Command -ScriptBlock $($commands["goto bookmark"]) -ArgumentList $arguments }
        "cd"   { Invoke-Command -ScriptBlock $($commands["goto subdirectory"]) -ArgumentList $arguments }
        "dict" { Invoke-Command -ScriptBlock $($commands["search dictionary"]) -ArgumentList $arguments }
    }
}
else {
    $key = $commands.Keys -join "`n" | fzf
    if ($key) { Invoke-Command -ScriptBlock $commands[$key] -ArgumentList $args }
}