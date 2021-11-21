switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "MINIEYESNB1-怡哲"
    {
        nvr -l "D:\minieyes\bin\$($args[0]).ps1"
    }
    "MINIEYES-PC2-chenv"
    {
        nvr -l "L:\bin\$($args[0]).ps1"
    }
    default
    {
        throw No matching settings
    }
}
nvr --remote-send "<C-Z>"
