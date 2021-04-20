Deploys an Event Hub, Storage Account and KeyVault in Azure and configures it to receive Graph change tracking notifications. You can specify what endpoint and types of events you wish to subscrive to. An easy way for you to monitor the events is to use the following community VSCode extension and start monitoring your Event Hub for new events coming in:
https://marketplace.visualstudio.com/items?itemName=Summer.azure-event-hub-explorer

**Parameters**

* ApplicationID

  Represents the Application ID of the Azure AD Application to use when authenticating. This application needs to have permissions to read entities related to the subscribtions (e.g. for users, it needs User.Read.All, etc.) and it also needs the following App Only permisions granted:

  * Application.Read.All (To obtain the Service Principal of the provided Azure AD App)

* ApplicationSecret

  Represents the secret to use to authenticate using the Azure AD Application specified by the Application ID.

* Resource

  Represents the resource endpoing to subscribe to (e.g. users, /me/messages, etc.);

* ChangeType

  Represents the type of event to subscrive to (e.g. created, updated, deleted).

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2FEventHub%2Fazuredeploy.json"><img src="https://aka.ms/deploytoazurebutton" alt="Deploy Environment in Azure" /></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnikcharlebois%2Fdemos%2Fmain%2F%2FEventHub%2Fazuredeploy.json"><img src="http://nikcharlebois.com/wp-content/uploads/2021/03/Visualize.png" alt="Visualize the components to be deployed" /></a>
