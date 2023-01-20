param (
    [string[]] $SearchText
)
switch ("$env:COMPUTERNAME-$env:USERNAME") {
    "MINIEYES-PC2-chenv"
    {
        & "L:\EverythingPortable\EverythingPortable.exe" -search "$SearchText"
    }
}
