Deploys an Event Hub, Storage Account and KeyVault in Azure and configures it to receive Graph change tracking notifications.

**Parameters**

* ApplicationID

  Represents the Application ID of the Azure AD Application to use when authenticating. This application needs to have the following App Only permisions granted:

  * Application.Read.All (To obtain the Service Principal of the provided Azure AD App)
  * Directory.Read.All
  * Users.ReadWrite.All (To be able to register for change notifications)

* ApplicationSecret

  Represents the secret to use to authenticate using the Azure AD Application specified by the Application ID.

* EventHubNamespace

  Represents the name of the Event Hub Namespace to be created;

* EventHubName

  Represents the name of the Event Hub to be created within the specified namespace.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2FEventHub%2Fazuredeploy.json"><img src="https://aka.ms/deploytoazurebutton" alt="Deploy Environment in Azure" /></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2F%2FEventHub%2Fazuredeploy.json"><img src="http://nikcharlebois.com/wp-content/uploads/2021/03/Visualize.png" alt="Visualize the components to be deployed" /></a>