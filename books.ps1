switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "MINIEYESNB1-怡哲"
    {
        $path = "D:/minieyes/books"
    }
    "NVT02863_NB-NVT02863"
    {
        $path = "D:/minieyes_chen/books"
    }
    "MINIEYES-PC2-chenv"
    {
        $path = "J:/minieyes/Dropbox/books"
    }
    default
    {
        throw No matching settings
    }
}

$option = $(fd --base-directory $path | fzf) -replace '\\','/'

if ($option) {
    START "$path/$option"
}
