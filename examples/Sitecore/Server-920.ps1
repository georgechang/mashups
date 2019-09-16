$dbPrefix = "sc_"
$dbServer = "localhost"

$username = "sitecore"
$password = "pass@word1"

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

Publish-SitecoreDatabases -Path ..\..\configs\9.2\Server\xp0-server-sitecore-configuration.json -ResourcesPath ..\..\resources\9.2\Server\Sitecore -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables