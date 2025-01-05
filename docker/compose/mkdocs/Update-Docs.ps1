$ErrorActionPreference = "Stop"

Install-Module powershell-yaml
Import-Module powershell-yaml

$compose_root = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..") | Select-Object -ExpandProperty -Path

# loop through folders

# generate services page using service.json file
# name
# description
# links
# guis
# update table for features based on which files exist (tests, sample database creates etc)