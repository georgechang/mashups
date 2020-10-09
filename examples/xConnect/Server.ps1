$version = "9.3"
$dbPrefix = "sc_"
$dbServer = "localhost"
$shards = 2

$username = "sa"
$password = "password"

$variables = @{
	automationUserName       = "automationuser";
	messagingUserName        = "messaginguser";
	poolsUserName            = "poolsuser";
	processingengineUserName = "processingengineuser";
	referenceDataUserName    = "referencedatauser";
	reportingUserName        = "reportinguser";
	collectionUserName       = "collectionuser";
}
$variables.add("automationPassword", $password)
$variables.add("messagingPassword", "$password")
$variables.add("poolsPassword", $password)
$variables.add("processingenginePassword", $password)
$variables.add("referenceDataPassword", $password)
$variables.add("reportingPassword", $password)
$variables.add("collectionPassword", $password)

Publish-SitecoreDatabases -Path ..\..\configs\$version\Server\xp0-server-xdb-configuration.json -ResourcesPath ..\..\resources\$version\Server\xConnect -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables

Invoke-ShardDeploymentTool -Path ..\..\resources\$version\Server\xConnect\collectiondeployment -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -ShardCount $shards

Invoke-Sqlcmd -Query "CREATE LOGIN $($variables.collectionUserName) WITH PASSWORD = '$($variables.collectionPassword)'" -ServerInstance $dbServer -Username $username -Password $password -Database "master" -ErrorAction SilentlyContinue
Invoke-Sqlcmd -Query "EXEC sp_addrolemember 'db_datareader', '$($variables.collectionUserName)'; EXEC sp_addrolemember 'db_datawriter', '$($variables.collectionUserName)';" -ServerInstance $dbServer -Username $username -Password $password -Database "master" -ErrorAction SilentlyContinue
Invoke-Sqlcmd -Query "CREATE USER $($variables.collectionUserName) FROM LOGIN $($variables.collectionUserName) GRANT SELECT ON SCHEMA :: __ShardManagement TO [$($variables.collectionUserName)] GRANT EXECUTE ON SCHEMA :: __ShardManagement TO [$($variables.collectionUserName)]" -ServerInstance $dbServer -Username $username -Password $password -Database "$($dbPrefix)Xdb.Collection.ShardMapManager"
for ($i = 0; $i -lt $shards; $i++) {
	Invoke-Sqlcmd -Query "CREATE USER $($variables.collectionUserName) FROM LOGIN $($variables.collectionUserName) EXEC [xdb_collection].[GrantLeastPrivilege] @UserName = '$($variables.collectionUserName)'" -ServerInstance $dbServer -Username $username -Password $password -Database "$($dbPrefix)Xdb.Collection.Shard$i"
}
#Invoke-Sqlcmd -Query "CREATE USER $($variables.collectionUserName) FROM LOGIN $($variables.collectionUserName) EXEC [xdb_collection].[GrantLeastPrivilege] @UserName = '$($variables.collectionUserName)'" -ServerInstance $dbServer -Username $username -Password $password -Database "$($dbPrefix)Xdb.Collection.Shard1"

#Invoke-ShardDeploymentTool -Path .\Sitecore.Xdb.Collection.Database.SqlShardingDeploymentTool.exe -DatabaseServer "prft-int-sql.database.windows.net,1433" -DatabasePrefix "prft-stg_" -DatabaseUserName "perficientadmin" -DatabasePassword "Prftadmin123!" -ShardCount 3