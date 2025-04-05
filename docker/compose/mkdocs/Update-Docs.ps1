$ErrorActionPreference = "Stop"

Install-Module powershell-yaml
Import-Module powershell-yaml

$compose_root = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..") | Select-Object -ExpandProperty Path

$y = ":white_check_mark:"
$n = ":x:"

# get domain variable
$env_file = Resolve-Path "$compose_root/../../db-lab.env"
$env_data = Get-Content -Path $env_file
$domain = $env_data.Where{ $_ -like "DOMAIN=*"}[0].split("=")[1]

# loop through folders

$features = [System.Collections.ArrayList]::new()

foreach($f in Get-ChildItem -Path $compose_root -Directory)
{
    if(Test-Path "$($f.FullName)/info.json")
    {
        $info = Get-Content -Path "$($f.FullName)/info.json" | ConvertFrom-Json

        $page = [System.Text.StringBuilder]::new()

        $feature = [PSCustomObject]@{
            Folder = $f.Name
            Name = $info.Name
            Database = $true
            Container = $false
            WebUI = @()
            Tests = @{
                Go = $false
                Powershell = $false
                Python = $false
            }
            Samples = @()
            Backup = $false
            Restore = $false
            Stress = $false
        }

        if($info.type -contains "gui" -or $info.type -contains "utility")
        {
            $feature.database = $false
        }

        $page.AppendLine("---") | Out-Null
        $page.AppendLine("tags:") | Out-Null
        foreach($t in $info.type)
        {
            $page.AppendLine("  - $($t)") | Out-Null
        }
        $page.AppendLine("---") | Out-Null

        $page.AppendLine("# $($info.name)`n") | Out-Null

        if(-not [String]::IsNullOrEmpty($info.links.homepage) -and $info.links.homepage -ne "n/a")
        {
            $page.AppendLine("[:fontawesome-solid-globe: Project Homepage]($($info.links.homepage))`n") | Out-Null
        }

        if(-not [String]::IsNullOrEmpty($info.links.repository) -and $info.links.repository -ne "closed-source")
        {
            $page.AppendLine("[:simple-git: Repository]($($info.links.repository))`n") | Out-Null
        }

        if(-not [String]::IsNullOrEmpty($info.links.registry))
        {
            $page.AppendLine("[:simple-docker: Container Registry]($($info.links.registry))`n") | Out-Null
        }

        if(-not [String]::IsNullOrEmpty($info.links.dbdb))
        {
            $page.AppendLine("[:material-database: DBDB.io]($($info.links.dbdb))`n") | Out-Null
        }

        foreach($d in $info.description)
        {
            $page.AppendLine("$d`n") | Out-Null
        }

        if($info.ui.count -gt 0)
        {
            $feature.WebUI = $info.ui
            $page.AppendLine("## GUI`n") | Out-Null
            foreach($u in $info.ui)
            {
                $page.AppendLine("- [$u](../$($u.ToLower().replace(" ","-")))") | Out-Null
            }
            $page.AppendLine("") | Out-Null
        }

        if(Test-Path "$($f.FullName)/docker-compose.yml")
        {
            $feature.Container = $true
            $compose = Get-Content -Path "$($f.FullName)/docker-compose.yml" | ConvertFrom-Yaml

            $images = @()
            $ports = @()
            $urls = @()

            foreach($k in $compose.services.keys)
            {
                $s = $compose.services[$k]
                $images += $s.Image

                foreach($p in $s.ports)
                {
                    $ports += $p.split(":")[0]
                }

                foreach($l in $s.labels)
                {
                    if($l -like "homepage.href=*")
                    {
                        $urls += $l.substring(14).replace("`${DOMAIN}",$domain)
                    }
                }

            }

            $images = $images | Sort-Object -Unique
            $ports = $ports | Sort-Object -Unique
            $urls = $urls | Sort-Object -Unique

            $page.AppendLine("## Images") | Out-Null
            $page.AppendLine("| Image | Tag |") | Out-Null
            $page.AppendLine("| --- | --- |") | Out-Null
            foreach($i in $images)
            {
                $page.AppendLine("| $($i.split(":")[0]) | $($i.split(":")[1]) |") | Out-Null
            }
            $page.AppendLine("") | Out-Null

            if($ports.count -gt 0)
            {
                $page.AppendLine("## Ports") | Out-Null
                foreach($p in $ports)
                {
                    $page.AppendLine("- $($p)") | Out-Null
                }

                $page.AppendLine("") | Out-Null
            }

            if($urls.count -gt 0)
            {
                $page.AppendLine("## Links") | Out-Null
                foreach($u in $urls)
                {
                    $page.AppendLine("- [$u]($u)") | Out-Null
                }
            }
        }

        if((Test-Path "$($f.FullName)/tests/go/test.go"))
        {
            $feature.tests.go = $true
        }
        if((Test-Path "$($f.FullName)/tests/powershell/test.ps1"))
        {
            $feature.tests.powershell = $true
        }
        if((Test-Path "$($f.FullName)/tests/python/test.py"))
        {
            $feature.tests.python = $true
        }
        if((Test-Path "$($f.FullName)/backup.sh"))
        {
            $feature.backup = $true
        }
        if((Test-Path "$($f.FullName)/restore.sh"))
        {
            $feature.restore = $true
        }
        if((Test-Path "$($f.FullName)/stress.sh"))
        {
            $feature.stress = $true
        }




        $page.ToString() | Out-File "$PSScriptRoot/content/docs/Services/$($f.Name).md"

        $features += $feature
    }
    else 
    {
        Write-Error "info.json not found in $($f.Name)" -ErrorAction Continue
    }
    # generate services page using service.json file
    # name
    # description
    # links
    # guis
}

# update table for features based on which files exist (tests, sample database creates etc)

foreach($db in (Get-ChildItem -Path (Resolve-Path "$($compose_root)/../../samples") -Directory))
{
    foreach($s in Get-ChildItem $db -File)
    {
        if($s.Length -eq 0){ continue }
        foreach($f in $features)
        {
            if($f.folder -like "$($s.BaseName)*")
            {
                $f.Samples += $db.BaseName
            }
        }
    }
}

$feature_page = [System.Text.StringBuilder]::new()

$headers = @(
    "Database",
    "Container",
    "Web GUI",
    "Go Test",
    "Pwsh Test",
    "Python Test",
    "Sample DB",
    "Backup",
    "Restore",
    "Stress Test"
)

$feature_page.AppendLine("# Features`n") | Out-Null

$feature_page.Append("|") | Out-Null
foreach($h in $headers)
{
    $feature_page.Append(" $($h) |") | Out-Null
}
$feature_page.AppendLine("") | Out-Null
$feature_page.Append("|") | Out-Null
foreach($h in $headers)
{
    $feature_page.Append(" --- |") | Out-Null
}
$feature_page.AppendLine("") | Out-Null

foreach($f in $features.Where{ $_.database } | Sort-Object -Property Name)
{
    $feature_page.Append("| $($f.Name) ") | Out-Null
    $feature_page.Append("| $(if($f.container){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.webui.count -eq 0){$n}else{"$($y)<br>$([String]::Join("<br>",$f.webui))"}) ") | Out-Null
    $feature_page.Append("| $(if($f.tests.go){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.tests.powershell){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.tests.python){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.samples.count -eq 0){$n}else{"$($y)<br>$([String]::Join("<br>",$f.samples))"}) ") | Out-Null
    $feature_page.Append("| $(if($f.backup){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.restore){$y}else{$n}) ") | Out-Null
    $feature_page.Append("| $(if($f.stress){$y}else{$n}) ") | Out-Null
    $feature_page.AppendLine("|") | Out-Null
}

$feature_page.ToString() | Out-File "$PSScriptRoot/content/docs/features.md"