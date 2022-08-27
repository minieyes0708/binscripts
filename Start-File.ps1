param (
    [string[]] $SearchText,
    [string] $Command = 'START',
    [string[]] $CommandArgs = @('')
)
& $Command (es $SearchText | fzf) "$CommandArgs"
