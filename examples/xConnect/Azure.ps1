$version = "9.3"
$dbPrefix = "sc_"
$dbServer = "sql.database.windows.net"

$username = "username"
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

Publish-SitecoreDatabases -Path ..\..\configs\$version\Azure\xp0-azure-xdb-configuration.json -ResourcesPath ..\..\resources\$version\Azure\xConnect -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables