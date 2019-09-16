$dbPrefix = "sc_"
$dbServer = "localhost"

$username = "sitecore"
$password = "pass@word1"

$variables = @{
	automationUserName = "automationuser";
	messagingUserName = "messaginguser";
	poolsUserName = "poolsuser";
	processingengineUserName = "processingengineuser";
	referenceDataUserName = "referencedatauser";
	reportingUserName = "reportinguser";
	collectionUserName = "collectionuser";
}
$variables.add("automationPassword", $password)
$variables.add("messagingPassword", "$password")
$variables.add("poolsPassword", $password)
$variables.add("processingenginePassword", $password)
$variables.add("referenceDataPassword", $password)
$variables.add("reportingPassword", $password)
$variables.add("collectionPassword", $password)

Publish-SitecoreDatabases -Path ..\..\configs\9.2\Server\xp0-server-xdb-configuration.json -ResourcesPath ..\..\resources\9.2\Server\xConnect -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables

Invoke-ShardDeploymentTool -Path ..\..\resources\9.2\Server\xConnect\collectiondeployment -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -ShardCount 3

#Invoke-ShardDeploymentTool -Path .\Sitecore.Xdb.Collection.Database.SqlShardingDeploymentTool.exe -DatabaseServer "prft-int-sql.database.windows.net,1433" -DatabasePrefix "prft-stg_" -DatabaseUserName "perficientadmin" -DatabasePassword "Prftadmin123!" -ShardCount 3