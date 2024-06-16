Install-Module AWS.Tools.DynamoDBv2
Import-Module AWS.Tools.DynamoDBv2

$ddb_args = @{
    AccessKey   = "local"
    EndpointUrl = "http://$($env:DOMAIN):8000"
    Region      = "us-east-1"
    SecretKey   = "local"
}

Get-DDBTableList  @ddb_args
