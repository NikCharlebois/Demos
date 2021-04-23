param(
    [string] [Parameter(Mandatory=$true)] $AppId,
    [string] [Parameter(Mandatory=$true)] $TenantId,
    [string] [Parameter(Mandatory=$true)] $EventHubUrl,
    [string] [Parameter(Mandatory=$true)] $Resource,
    [string] [Parameter(Mandatory=$true)] $ChangeType,
    [string] [Parameter(Mandatory=$true)] $EncryptionCertificateId
)

Install-Module Microsoft.Graph.Authentication -Force | Out-Null
Import-Module Microsoft.Graph.Authentication -Force | Out-Null
Install-Module Microsoft.Graph.ChangeNotifications -Force | Out-Null
Import-Module Microsoft.Graph.ChangeNotifications -Force | Out-Null

$url = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
$body = @{
    scope = "https://graph.microsoft.com/.default"
    grant_type = "client_credentials"
    client_secret = ${Env:AppSecret}
    client_info = 1
    client_id = $AppId
}
Write-Host "Requesting Access Token for Microsoft Graph..." -NoNewline
$OAuthReq = Invoke-RestMethod -Uri $url -Method Post -Body $body
$AccessToken = $OAuthReq.access_token
Write-Host "Done"

Write-Host "Connecting to Microsoft Graph..." -NoNewline
Connect-MgGraph -AccessToken $AccessToken | Out-String
Write-Host "Done"

Start-Sleep 150

Write-Host "Creating new Subscription..." -NoNewline
try
{
    $values = @{
        ChangeType = $ChangeType
        NotificationUrl = $EventHubUrl
        Resource = $Resource
        IncludeResourceData = $true
        ExpirationDateTime = (([System.DateTime]::UtcNow).AddMinutes(60))
    }
    if (-not [System.String]::IsNullOrEmpty($EncryptionCertificateId) -or $EncryptionCertificateId -ne '[]')
    {
        $values.Add("EncryptionCertificateId", $EncryptionCertificateId)
    }
    New-MgSubscription @values | Out-String
    Write-Host "Done"
}
catch
{
    Write-Host $_
}