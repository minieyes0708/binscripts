$script:targets = @(
    '~/.vifm',
    '~/.bashrc.d',
    '~/.config/powershell',
    'D:/minieyes_chen/software/bin',
    'D:/minieyes_chen/program/learning/java/Algorithms/',
    'D:/minieyes_chen/software/Neovim/share/nvim/.vimrc.d',
    ''
)

$script:pwd = (pwd).Path
foreach ($target in $script:targets) {
    if ($target) {
        echo "===== Sync ${target} ====="
        cd $target
        git pull
        git push
    }
}
cd $script:pwd
