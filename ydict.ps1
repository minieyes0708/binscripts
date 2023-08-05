$url = "https://tw.dictionary.search.yahoo.com/search?p=$($args[0])"
$request = Invoke-WebRequest -Uri $url -UseBasicParsing
$HTML = New-Object -Com 'HTMLFile'
[string]$htmlBody = $request.Content
$HTML.write([ref]$htmlBody)
Write-Host $HTML.getElementsByClassName('grp-main')[0].innerText