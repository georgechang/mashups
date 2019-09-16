# mashups - Many Assorted Sitecore Helper Utilities in PowerShell

## Sitecore Installation

### `Publish-SitecoreDatabases`

Publishes Sitecore databases from an extracted WDP based on a designated configuration. Configurations can be found the in the `configs` folder as well as examples on how to use it in the `examples` folder.

#### Usage

`Publish-SitecoreDatabases -Path .\xp0-server-xdb-configuration.json -ResourcesPath .\resources -DatabaseServer "database.server.com" -DatabasePrefix "sc_" -DatabaseUserName "admin" -DatabasePassword "password" -Variables $variables`

### `Invoke-ShardDeploymentTool`

Executes the xConnect collection deployment tool to create the shard map manager and a corresponding number of shards.

#### Usage

`Invoke-ShardDeploymentTool -Path .\collectiondeployment -DatabaseServer "database.server.com" -DatabasePrefix "sc_" -DatabaseUserName "admin" -DatabasePassword "password" -ShardCount 3`

## Sitecore Host

### `Install-ScHostPackage`

Installs a Sitecore Host plugin NuGet package into a Sitecore Host instance. The plugin can be installed as a host plugin (i.e., consuming a plugin during the development of a Sitecore Host application) or as a plugin into an existing Sitecore Host instance as a runtime plugin.

#### Usage

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost`

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost -Runtime`