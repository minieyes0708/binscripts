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
    default
    {
        $path = "J:/minieyes/Dropbox/books"
    }
}

$option = $(fd --base-directory $path | fzf) -replace '\\','/'

if ($option) {
    START "$path/$option"
}
