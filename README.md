# mashups - Many Assorted Sitecore Helper Utilities in PowerShell

[![Build Status](https://github.com/georgechang/mashups/workflows/PowerShell%20Gallery/badge.svg)](https://github.com/georgechang/mashups/actions?query=workflow%3Amashups)

## Sitecore Installation

### `Publish-SitecoreDatabases`

Publishes Sitecore databases from an extracted WDP based on a designated configuration. Configurations can be found the in the `configs` folder as well as examples on how to use it in the `examples` folder.

#### Usage

`Publish-SitecoreDatabases -Path .\xp0-server-xdb-configuration.json -ResourcesPath .\resources -DatabaseServer "database.server.com" -DatabasePrefix "sc_" -DatabaseUserName "admin" -DatabasePassword "password" -Variables $variables`

### `Invoke-ShardDeploymentTool`

Executes the xConnect collection deployment tool to create the shard map manager and a corresponding number of shards.

#### Usage

`Invoke-ShardDeploymentTool -Path .\collectiondeployment -DatabaseServer "database.server.com" -DatabasePrefix "sc_" -DatabaseUserName "admin" -DatabasePassword "password" -ShardCount 3`

### `Update-XdbDatabaseServerName`

Updates the database server information in an xDB database including the shard map manager and individual shard databases.

#### Usage

`Update-XdbDatabaseServerName -DatabaseServer "database.server.com" -DatabasePrefix "sc_" -DatabaseUserName "admin" -DatabasePassword "password" -DatabaseName "sc_Xdb.Collection.ShardMapManager" -NewDatabaseServer "localhost,1433"`

## Sitecore Host

### `Install-ScHostPackage`

Installs a Sitecore Host plugin NuGet package into a Sitecore Host instance. The plugin can be installed as a host plugin (i.e., consuming a plugin during the development of a Sitecore Host application) or as a plugin into an existing Sitecore Host instance as a runtime plugin.

#### Usage

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost`

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost -Runtime`
