param (
    $subcommand
)

$commands = @{}
foreach ($file in Get-ChildItem (Join-Path $PSScriptRoot x)) {
    $info = &$file
    $commands[$info.description] = $info.scriptblock
}

if ($subcommand) {
    $arguments = $args
    switch ($subcommand) {
        "p"      { Invoke-Command -ScriptBlock $($commands["run program"]) -ArgumentList $arguments }
        "dict"   { Invoke-Command -ScriptBlock $($commands["search dictionary"]) -ArgumentList $arguments }
    }
}
else {
    $key = $commands.Keys -join "`n" | fzf
    if ($key) { Invoke-Command -ScriptBlock $commands[$key] -ArgumentList $args }
}
