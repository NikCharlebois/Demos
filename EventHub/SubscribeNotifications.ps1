param(
    [string] [Parameter(Mandatory=$true)] $AppId,
    [string] [Parameter(Mandatory=$true)] $CertificateThumbprint,
    [string] [Parameter(Mandatory=$true)] $TenantId
)

Install-Module Microsoft.Graph.Authentication -Force
Import-Module Microsoft.Graph.Authentication -Force
Install-Module Microsoft.Graph.ChangeNotifications -Force
Import-Module Microsoft.Graph.ChangeNotifications -Force

Connect-MgGraph @PSBoundParameters