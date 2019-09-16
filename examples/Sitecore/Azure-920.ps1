$dbPrefix = "prft-stg_"
$dbServer = "prft-int-sql.database.windows.net"

$username = "perficientadmin"
$password = "Prftadmin123!"

$variables = @{
	coreUserName = "coreuser";
	securityUserName = "securityuser";
	masterUserName = "masteruser";
	webUserName = "webuser";
	experienceFormsUserName = "formsuser";
	exmUserName = "exmmasteruser";
	processingTasksUserName = "tasksuser";
}
$variables.add("corePassword", $password)
$variables.add("securityPassword", "$password")
$variables.add("masterPassword", $password)
$variables.add("webPassword", $password)
$variables.add("experienceFormsPassword", $password)
$variables.add("exmPassword", $password)
$variables.add("processingTasksPassword", $password)

$variables.add("adminPassword", "b")

Publish-SitecoreDatabases -Path ..\..\configs\xp0-azure-sitecore-configuration.json -ResourcesPath .\resources -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables