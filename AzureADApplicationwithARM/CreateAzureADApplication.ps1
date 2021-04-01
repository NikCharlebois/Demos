Connect-AzAccount -Identity
<#Write-Host "Installing {Microsoft.Graph.Applications}..." -NoNewline
Install-Module Microsoft.Graph.Applications -Force -Confirm:$false | Out-Null
Write-Host "Done"

Write-Host "Importing {Microsoft.Graph.Applications}..." -NoNewline
Import-Module Microsoft.Graph.Applications -Force | Out-Null
Write-Host "Done"

Write-Host "Creating new Application {${ENV:ApplicationName}} with URIs {${ENV:IdentifierUris}}..." -NoNewline
$AADApp = New-MgApplication -DisplayName ${ENV:ApplicationName} `
                            -IdentifierUris ${ENV:IdentifierUris}
Write-Host "Done"#>