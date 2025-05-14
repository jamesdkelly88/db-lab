$remote_path = "https://download.microsoft.com/download/7519f0ff-997c-4f36-b5aa-9a51d47dd34c/SSMS-Setup-ENU.exe"
$local_path = "C:\SSMS\SSMS-Setup-ENU.exe"

New-Item -ItemType Directory -Path "C:\SSMS"

Invoke-WebRequest $remote_path -OutFile $local_path

# Install SSMS

# Setup Kiosk mode

# Windows Updates to manual