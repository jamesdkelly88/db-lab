Install-Module SqlServer
Import-Module SqlServer

$hostname            = $env:DOMAIN
$port                = 1435
$username            = "sa"
$password            = $env:SECRET_PASSWORD

Invoke-Sqlcmd -ServerInstance "$hostname,$port" -Username $username -Password $password -TrustServerCertificate -Query "SELECT @@VERSION AS Version"