$target_path = $(Get-Content ~/.vifm/user/bookmarks.txt | fzf)

if ($target_path) {
    Set-Location $target_path
}
