@{
    "description" = "J drive link to ds923"
    "scriptblock" = { New-PSDrive -Name J -PSProvider FileSystem -Root \\DS923plus\home -Credential (Get-Credential) -Persist }
}
