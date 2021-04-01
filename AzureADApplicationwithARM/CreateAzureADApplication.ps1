Write-Output "Installing {Microsoft.Graph.Applications}..."
Install-Module Microsoft.Graph.Applications -Force -Confirm:$false

Write-Output "Importing {Microsoft.Graph.Applications}..."
Import-Module Microsoft.Graph.Applications -Force

Write-Output "Creating new Application {${ENV:ApplicationName}} with URIs {${ENV:IdentifierUris}}..."
$AADApp = New-MgApplication -DisplayName ${ENV:ApplicationName} `
                            -IdentifierUris ${ENV:IdentifierUris}