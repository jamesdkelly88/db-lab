$hostname            = $env:DOMAIN
$port                = 2379
$url                 = "http://$($hostname):$($port)"
$prefix              = [char]0
$end_range           = [char]127
$key_b64             = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($prefix))
$end_range_b64       = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($end_range))

$version = Invoke-RestMethod -Method Get -Uri "$($url)/version"

Write-Host "Version: $($version.etcdserver)"

$result = Invoke-RestMethod -Method Post -Uri "$($url)/v3/kv/range" -Body "{`"key`": `"$key_b64`", `"range_end`": `"$end_range_b64`"}" -ContentType "application/json"


if($result.kvs)
{
    $result.kvs | Select-Object -Property @{
        n='Key'; 
        e={ [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_.Key))}
    }, @{
        n='Value'; 
        e={ [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_.Value))}
    } | Format-Table
}
else 
{
    Write-Host "No keys found"
}