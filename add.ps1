switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "MINIEYESNB1-怡哲"
    {
        mynvr "D:\minieyes\bin\$($args[0]).ps1"
    }
    "NVT02863_NB-NVT02863"
    {
        mynvr "D:\minieyes_chen\software\bin\$($args[0]).ps1"
    }
    "MINIEYES-PC2-chenv"
    {
        mynvr "L:\bin\$($args[0]).ps1"
    }
    default
    {
        throw No matching settings
    }
}
