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

Install-Module Microsoft.Graph.Application -Force -Confirm:$false