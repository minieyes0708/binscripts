$target = ($env:PATHS -Split ';' | fzf)
if ($target) {
    Set-Location $target
}
