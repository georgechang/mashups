$version = "9.3"
$dbPrefix = "sc_"
$dbServer = "sql.database.windows.net"

$username = "username"
$password = "password"

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

$variables.add("adminPassword", "password")

Publish-SitecoreDatabases -Path ..\..\configs\$version\Azure\xp0-azure-sitecore-configuration.json -ResourcesPath ..\..\resources\$version\Server\Sitecore -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables