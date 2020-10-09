$version = "9.3"
$dbPrefix = "sc_"
$dbServer = "localhost"

$username = "sa"
$password = "password"

$variables = @{
	coreUserName            = "coreuser";
	securityUserName        = "securityuser";
	masterUserName          = "masteruser";
	webUserName             = "webuser";
	experienceFormsUserName = "formsuser";
	exmUserName             = "exmmasteruser";
	tasksUserName           = "tasksuser";
}
$variables.add("corePassword", $password)
$variables.add("securityPassword", "$password")
$variables.add("masterPassword", $password)
$variables.add("webPassword", $password)
$variables.add("experienceFormsPassword", $password)
$variables.add("exmPassword", $password)
$variables.add("tasksPassword", $password)

$variables.add("adminPassword", "password")

Publish-SitecoreDatabases -Path ..\..\configs\$version\Server\xp0-server-sitecore-configuration.json -ResourcesPath ..\..\resources\$version\Server\Sitecore -DatabaseServer $dbServer -DatabasePrefix $dbPrefix -DatabaseUserName $username -DatabasePassword $password -Variables $variables
