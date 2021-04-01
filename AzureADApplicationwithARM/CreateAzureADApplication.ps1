<#$AADApp = Get-AzADApplication -DisplayName ${ENV:ApplicationName}

if ($null -eq $AADApp)
{
    Write-Output "Couldn't find and existing Azure Active Directory Application named {${ENV:ApplicationName}}"
    $AADApp = New-AzADApplication -DisplayName ${ENV:ApplicationName} -IdentifierUris ${ENV:IdentifierUris}
}
else
{
    Write-Output "An existing Azure Active Directory Application named {${ENV:ApplicationName}} already exists" 
}#>

Install-Module Microsoft.Graph.Applications -Force -Confirm:$false
Import-Module Microsoft.Graph.Applications -Force

New-MgApplication -DisplayName ${ENV:ApplicationName} `
    -IdentifierUris ${ENV:IdentifierUris}