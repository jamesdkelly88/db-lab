$hostname            = $env:DOMAIN
$port                = 7474
$username            = "neo4j"
$password            = $env:SECRET_PASSWORD

$url                 = "http://$($hostname):$($port)/db/neo4j/query/v2"
$cred                = [PSCredential]::new($username, ($password | ConvertTo-SecureString -AsPlainText -Force))

$query               = "call dbms.components() yield name, versions, edition unwind versions as version return name, version, edition;"

$rest = @{
    Uri = $url
    Method = "POST"
    Body = @{
        statement = $query
    } | ConvertTo-Json
    Credential = $cred
    ContentType = "application/json"
    AllowUnencryptedAuthentication = $true
}

$response = Invoke-RestMethod @rest

$data = $response.data

$output = @()
foreach($v in $data.values)
{
    $o = [pscustomobject]@{}
    for($i = 0; $i -lt $data.fields.count; $i++)
    {
        $o | Add-Member -NotePropertyName $data.fields[$i] -NotePropertyValue $v[$i]
    }
    $output += $o
}

$output | Format-Table