param(
    [Parameter(Mandatory = $false)]
    [System.String]
    $ApplicationName,

    [Parameter(Mandatory = $false)]
    [System.String[]]
    $IdentifierUris,

    [Parameter(Mandatory = $false)]
    [System.String[]]
    $DelegatedPermissions,

    [Parameter(Mandatory = $false)]
    [System.String[]]
    $AppOnlyPermissions
)

$AADApp = Get-AzADApplication -DisplayName $ApplicationName

if ($null -eq $AADApp)
{
    Write-Output "Couldn't find and existing Azure Active Directory Application named {$DisplayName}"
    $AADApp = New-AzADApplication -DisplayName $ApplicationName -IdentifierUris $IdentifierUris
}
else
{
    Write-Output "An existing Azure Active Directory Application named {$DisplayName} already exists" 
}