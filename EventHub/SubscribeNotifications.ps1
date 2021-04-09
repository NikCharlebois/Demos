param(
    [string] [Parameter(Mandatory=$true)] $AppId,
    [string] [Parameter(Mandatory=$true)] $AppSecret,
    [string] [Parameter(Mandatory=$true)] $TenantId,
    [string] [Parameter(Mandatory=$true)] $EventHubUrl
)

Install-Module Microsoft.Graph.Authentication -Force
Import-Module Microsoft.Graph.Authentication -Force
Install-Module Microsoft.Graph.ChangeNotifications -Force
Import-Module Microsoft.Graph.ChangeNotifications -Force

$url = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
$body = @{
    scope = "https://graph.microsoft.com/.default"
    grant_type = "client_credentials"
    client_secret = $AppSecret
    client_info = 1
    client_id = $AppId
}

Write-Host "Requesting Access Token for Microsoft Graph..." -NoNewline
$OAuthReq = Invoke-RestMethod -Uri $url -Method Post -Body $body
$AccessToken = $OAuthReq.access_token
Write-Host "Done"

Write-Host "Connecting to Microsoft Graph..." -NoNewline
Connect-MgGraph -AccessToken $AccessToken | Out-Null
Write-Host "Done"

Write-Host "Creating new Subscription..." -NoNewline
New-MgSubscription -ChangeType "Updated,Deleted" `
                   -NotificationUrl $EventHubUrl `
                   -Resource '/users' `
                   -ClientState 'SecretClientState' `
                   -ExpirationDateTime (([System.DateTime]::Now).AddMinutes(15))
Write-Host "Done"