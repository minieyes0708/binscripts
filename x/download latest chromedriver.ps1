{
    #Import-Module -Name Selenium
    #$driver = Start-SeChrome -BinaryPath "C:\Program Files\Google\Chrome\Application\chrome.exe" -WebDriverDirectory $env:BinScriptPath
    #Enter-SeUrl -Driver $driver -Url 'https://googlechromelabs.github.io/chrome-for-testing/'
    #$stable_section = Find-SeElement -Driver $driver -XPath "//section[@id='stable']//tr"
    #$win32_chromedriver_row = $stable_section | Where-Object {
        #$ths = $_.FindElementsByTagName('th');
        #$ths[0].Text -eq 'chromedriver' -and $ths[1].Text -eq 'win32'
    #}
    #$download_url = $win32_chromedriver_row.FindElementsByTagName('td')[0].Text
    #Stop-SeDriver -Driver $driver

    $download_url = "https://storage.googleapis.comchrome-for-testing-public/$(Read-Host -Prompt Version)/win32/chromedriver-win32.zip"
    Invoke-WebRequest -Uri $download_url -OutFile "$($env:BinScriptPath)\chromedriver.zip"
    Push-Location $env:BinScriptPath
    & 7z x chromedriver.zip
    Copy-Item -Force chromedriver-win32\chromedriver.exe .
    Remove-Item -Recurse -Force chromedriver-win32, chromedriver.zip
    Pop-Location
}
