Install-Module PSPostgres
Import-Module PSPostgres

$username            = "postgres"
$password            = $env:SECRET_PASSWORD

$connection_string   = "Server=localhost;Port=5433;Database=postgres;User Id=$($username);Password=$($password)"
$connection          = Connect-Postgres -ConnectionString $connection_string

Invoke-PostgresQuery -Connection $connection -Query "SELECT version();"