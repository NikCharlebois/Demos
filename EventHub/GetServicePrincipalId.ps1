param(
    [string] [Parameter(Mandatory=$true)] $AppId,
    [string] [Parameter(Mandatory=$true)] $AppSecret,
    [string] [Parameter(Mandatory=$true)] $TenantId,
    [string] [Parameter(Mandatory=$true)] $AppToGet
)

Install-Module Microsoft.Graph.Authentication -Force
Import-Module Microsoft.Graph.Authentication -Force
Install-Module Microsoft.Graph.Applications -Force
Import-Module Microsoft.Graph.Applications -Force

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

Write-Host "Retrieving Service Principal with Application ID {$AppToGet}..." -NoNewline
$application = Get-MgServicePrincipal -All:$true -Filter "AppID eq '$AppToGet'"
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $application.Id
Write-Host "Done"