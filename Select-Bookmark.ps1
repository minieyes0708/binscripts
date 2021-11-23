$target_path = $(Get-Content ~/.vifm/user/bookmarks.txt | fzf)

if ($target_path) {
    echo $target_path
} else {
    echo (pwd).Path
}
