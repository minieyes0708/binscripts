$target = ($global:PATHS | fzf)
if ($target) {
    Set-Location $target
}
