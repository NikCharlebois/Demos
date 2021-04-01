Install-Module Microsoft.Graph.Applications -Force -Confirm:$false
Import-Module Microsoft.Graph.Applications -Force

$AADApp = New-MgApplication -DisplayName ${ENV:ApplicationName} `
                            -IdentifierUris ${ENV:IdentifierUris}