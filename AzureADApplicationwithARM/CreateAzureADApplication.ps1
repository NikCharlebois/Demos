Write-Host "Installing {Microsoft.Graph.Applications}..."
Install-Module Microsoft.Graph.Applications -Force -Confirm:$false

Write-Host "Importing {Microsoft.Graph.Applications}..."
Import-Module Microsoft.Graph.Applications -Force

Write-Host "Creating new Application {${ENV:ApplicationName}} with URIs {${ENV:IdentifierUris}}..."
$AADApp = New-MgApplication -DisplayName ${ENV:ApplicationName} `
                            -IdentifierUris ${ENV:IdentifierUris}