$dbPrefix = "prftdeploymenttest-sql_"
$dbServer = "prftdeploymenttest-sql.database.windows.net"

$username = "sitecore"
$password = "pass@word1"

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

Publish-SitecoreDatabases -Path ..\..\configs\9.3\Azure\xp0-azure-xdb-configuration.json -ResourcesPath ..\..\resources\9.3\Azure\xConnect -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables
Publish-SitecoreDatabases -Path ..\..\configs\9.3\Azure\xp0-azure-xdb-smm-configuration.json -ResourcesPath ..\..\resources\9.3\Azure\xConnect -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables
Update-XdbDatabaseServerName -DatabaseServer $dbServer -DatabaseName "$($dbPrefix)xdb.collection.shard0" -DatabaseUserName $username -DatabasePassword $password
Update-XdbDatabaseServerName -DatabaseServer $dbServer -DatabaseName "$($dbPrefix)xdb.collection.shard1" -DatabaseUserName $username -DatabasePassword $password