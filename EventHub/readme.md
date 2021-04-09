Deploys and Event Hub, Storage Account and KeyVault in Azure and configures it to receive Graph change tracking notifications.

**Parameters**

* GraphChangeTrackingPrincipalID

  Represents the Service Principal ID of the Microsoft Graph Change Tracking app. This can be obtained by running the following lines of PowerShell:

  ```PowerShell PowerShell Code
   Connect-AzureAD
   Get-AzureADServicePrincipal -All:$true | Where-Object -FilterScript {$_.AppId -eq '0bf30f3b-4a52-48df-9a82-234910c4a086'} | Select-Object ObjectID
  ```


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2FEventHub%2Fazuredeploy.json"><img src="https://aka.ms/deploytoazurebutton" alt="Deploy Environment in Azure" /></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2F%2FEventHub%2Fazuredeploy.json"><img src="http://nikcharlebois.com/wp-content/uploads/2021/03/Visualize.png" alt="Visualize the components to be deployed" /></a>