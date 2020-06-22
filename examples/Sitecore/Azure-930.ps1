$dbPrefix = "prftdeploymenttest-sql_"
$dbServer = "prftdeploymenttest-sql.database.windows.net,1433"

$username = "sitecore"
$password = "pass@word1"

$variables = @{
	coreUserName            = "coreuser";
	securityUserName        = "securityuser";
	masterUserName          = "masteruser";
	webUserName             = "webuser";
	experienceFormsUserName = "formsuser";
	exmUserName             = "exmmasteruser";
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

Publish-SitecoreDatabases -Path ..\..\configs\9.3\Azure\xp0-azure-sitecore-configuration.json -ResourcesPath ..\..\resources\9.3\Azure\Sitecore -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables