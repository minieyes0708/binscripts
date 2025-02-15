@{
    "description" = "search dictionary"
    "scriptblock" = {
        $url = "https://tw.dictionary.search.yahoo.com/search?p=$(Read-Host "Search Text")"
        $request = Invoke-WebRequest -Uri $url -UseBasicParsing
        $HTML = New-Object -Com 'HTMLFile'
        [string]$htmlBody = $request.Content
        $HTML.write([ref]$htmlBody)
        Write-Host $HTML.getElementsByClassName('grp-main')[0].innerText
    }
}
