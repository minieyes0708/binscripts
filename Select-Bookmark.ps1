$target_path = $(Get-Content $env:DotConfig/bookmarks.txt | fzf)

switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "NVT02863_NB-NVT02863"
    {
        if ($target_path -eq "D:/minieyes_chen/program") {
            $target_path = $(fd -a -i -d 1 -t d . $target_path | fzf)
        }
    }
}

if ($target_path) {
    echo $target_path
} else {
    echo (pwd).Path
}
