Param(
    [Parameter(Mandatory=$true, HelpMessage='prompt:')]
    [Alias('p')]
    [string]$prompt
)
$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer " + (Get-Content ~/.chatgpt/APIKey)
}

$body = @{
    "model" = "text-davinci-003"
    "prompt" = $prompt
    "temperature" = 0.5
    "max_tokens" = 100
} | ConvertTo-Json

$url = "https://api.openai.com/v1/completions"

$response = Invoke-RestMethod -Uri $url -Headers $headers -Method Post -Body $body

foreach ($choice in $response.choices){
    Write-Output($choice.Text.Trim(" ","`r","`n"))
}