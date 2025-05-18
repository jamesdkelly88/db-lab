# Download SSMS
$remote_path = "https://download.microsoft.com/download/7519f0ff-997c-4f36-b5aa-9a51d47dd34c/SSMS-Setup-ENU.exe"
$local_path = "$PSScriptRoot\SSMS-Setup-ENU.exe"
$installed_path = "C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE\Ssms.exe"
Invoke-WebRequest $remote_path -OutFile $local_path

# Install SSMS
Start-Process -FilePath $local_path -ArgumentList @("/Install","/Passive") -Wait

# Create task to run SSMS at startup
Import-Module ScheduledTasks
$action = New-ScheduledTaskAction -Execute $installed_path
$trigger = New-ScheduledTaskTrigger -AtLogon
$task = New-ScheduledTask -Action $action -Trigger $trigger
Register-ScheduledTask SSMS -InputObject $task

# Run now
Start-ScheduledTask SSMS

# TODO:Setup Kiosk mode
# Enable-WindowsOptionalFeature -FeatureName Client-DeviceLockdown,Client-EmbeddedShellLauncher -Online
# use shell launcher and applocker to auto-launch SSMS and lock down everything else

# Remove from local admins


# Restart