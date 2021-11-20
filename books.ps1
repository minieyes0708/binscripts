switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "MINIEYESNB1-怡哲"
    {
        $path = "D:/minieyes/books"
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
