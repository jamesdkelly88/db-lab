#Requires -Module Pester -Version 5

BeforeDiscovery {
    $repoRoot = Resolve-Path "$PSScriptRoot/../.."
    $docker_folders = Get-ChildItem -Path (Join-Path -Path $repoRoot -ChildPath "docker/compose") -Directory
    Write-Host "Docker folders: $($docker_folders.count)"
}

Describe "Docker" {
    Context "<_.name>" -ForEach($docker_folders) {
        BeforeAll {
            Set-Location $_.FullName
            try {
                $info = Get-Content "info.json" | ConvertFrom-Json
            }
            catch {
                $info = "{}" | ConvertFrom-Json
            }
            try {
                if($info.type.where{ $_ -notin @("gui","utility") }.count -gt 0)
                {
                    $is_db = $true
                }
                else 
                {
                    $is_db = $false
                }
            }
            catch {
                $is_db = $null
            }
        }
        It "contains docker-compose.yml" {
            "docker-compose.yml" | Should -Exist
        }
        It "doesn't contain a dockerfile" {
            "Dockerfile" | Should -Not -Exist
        }
        It "contains info.json" {
            "info.json" | Should -Exist
        }
        It "should have a title" {
            $info.name | Should -Not -BeNullOrEmpty
        }
        It "should have a description" {
            $info.description | Should -Not -BeNullOrEmpty
        }
        It "should have a type" {
            $info.type | Should -Not -BeNullOrEmpty
        }
        It "should have a valid type" {
            $valid = @("blob","document","embedded","graph","gui","hierarchical","in-memory","key-value","ledger","object-oriented","relational","spatial","text-search","time-series","utility","vector","wide-column")
            $invalid = @()
            foreach($t in $info.type)
            {
                if($t -notin $valid)
                {
                    $invalid += $t
                }
            }
            $invalid | Should -BeNullOrEmpty
        }
        It "should have a homepage" {
            $info.links.homepage | Should -Not -BeNullOrEmpty
        }
        It "should have a registry" {
            $info.links.registry | Should -Not -BeNullOrEmpty
        }
        It "should have a repository" {
            $info.links.repository | Should -Not -BeNullOrEmpty
        }
        It "should have a dbdb link" {
            if($is_db)
            {
                $info.links.dbdb | Should -Not -BeNullOrEmpty
            }
        }
        It "should have a tests folder" {
            if($is_db)
            {
                "tests" | Should -Exist
            }
        }
        It "should have a go test" {
            if($is_db)
            {
                "tests/go" | Should -Exist
            }
        }
        It "should have a powershell test" {
            if($is_db)
            {
                "tests/powershell" | Should -Exist
            }
        }
        It "should have a python test" {
            if($is_db)
            {
                "tests/python" | Should -Exist
            }
        }
        It "should have a backup script" {
            if($is_db)
            {
                "backup.sh" | Should -Exist
            }
        }
        # It "should have a restore script" {
        #     if($is_db)
        #     {
        #         "restore.sh" | Should -Exist
        #     }
        # }
        # It "should have a stress-test script" {
        #     if($is_db)
        #     {
        #         "stress.sh" | Should -Exist
        #     }
        # }
        It "should not have a sample script" {
            "sample.sh" | Should -Not -Exist
        }
    }
}