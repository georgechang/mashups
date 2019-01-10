# mashups - Many Assorted Sitecore Host Utilities in PowerShell

## Utilities

### `Install-ScHostPackage`

Installs a Sitecore Host plugin NuGet package into a Sitecore Host instance. The plugin can be installed as a host plugin (i.e., consuming a plugin during the development of a Sitecore Host application) or as a plugin into an existing Sitecore Host instance as a runtime plugin.

#### Usage

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost`

`Install-ScHostPackage -Path C:\packages\Sitecore.Host.Plugin.1.0.0.nupkg -HostPath C:\inetpub\wwwroot\schost -Runtime`
