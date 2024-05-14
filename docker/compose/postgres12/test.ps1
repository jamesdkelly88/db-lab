Install-Module PSPostgres
Import-Module PSPostgres

$hostname            = $env:DOMAIN
$port                = 5436
$username            = "postgres"
$password            = $env:SECRET_PASSWORD

$connection_string   = "Server=$($hostname);Port=$($port);Database=postgres;User Id=$($username);Password=$($password)"
$connection          = Connect-Postgres -ConnectionString $connection_string

Invoke-PostgresQuery -Connection $connection -Query "SELECT version();"