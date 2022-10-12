﻿[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet
Set-PSRepository PSGallery -InstallationPolicy Trusted

Install-Module PowershellGet -Force -Scope AllUsers -Confirm:$false
Install-module Az -Scope AllUsers -Confirm:$false
Install-module MSGraph -Scope AllUsers -Confirm:$false
Install-module MSOnline -Scope AllUsers -Confirm:$false
Install-module Bicep -Scope AllUsers -Confirm:$false
Install-module ExchangeOnlineManagement -Scope AllUsers -Confirm:$false
Install-Module MicrosoftTeams -Scope AllUsers -confirm:$false
Install-Module AzureAD -Scope AllUsers -confirm:$false
Install-Module WindowsAutoPilotIntune -Scope AllUsers -confirm:$false

# Install Azure CLI
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install git -y
choco install notepadplusplus -y
choco install bicep -y
choco install python -y
choco install vscode -y 
choco install googlechrome -y 
choco install firefox -y
choco install dotnet -y
choco install powertoys -y
choco install mobaxterm -y
choco install microsoft-windows-terminal -y
choco install wsl2 -y
choco install wsl-ubuntu-2004 -y
choco install displaylink -y
choco install spotify -y
choco install foxitreader -y
choco install 7zip -y
choco install forticlientvpn -y
choco install rdmfree -y
choco install greenshot -y
choco install filezilla -y
choco install wireshark -y
choco install obs-studio -y
choco install HeidiSQL -y
choco install msoledbsql -y
choco install discord -y
choco install AzureStorageExplorer -y
choco install anydesk -y
choco install nmap -y
choco install rpi-imager -y
choco install datagrip -y
choco install PyCharm-community -y
choco install Typora -y
choco install postman -y

# Install Powershell 7
write-host 'Customization: Install the latest Microsoft PowerShell'
$appName = 'pwsh'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath 
$URL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/PowerShell-7.2.0-win-x64.msi'
$msi = 'pwsh.msi'
$outputPath = $LocalPath + '\' + $msi
Invoke-WebRequest -uri $URL -OutFile $outputPath
Start-Process -FilePath msiexec.exe -Args "/package $outputPath /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1" -Wait

# Install KeePass
$appName = 'KeePass'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath
$URL = 'https://newcontinuum.dl.sourceforge.net/project/keepass/KeePass%202.x/2.49/KeePass-2.49-Setup.exe'
$URLexe = 'keepass.exe'
$outputPath = $LocalPath + '\' + $URLexe
Invoke-WebRequest -Uri $URL -OutFile $outputPath
write-host 'Starting Install  KeePass'
Start-Process -FilePath $outputPath -Args "/install /VERYSILENT " -Wait
write-host 'Finished Install the of KeePass'


# Install AVD Client
write-host 'Customization: Install the latest AVD Client'
$appName = 'AVDClient'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath 
$URL = 'https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWOzKx'
$msi = 'avdclient.msi'
$outputPath = $LocalPath + '\' + $msi
Invoke-WebRequest -uri $URL -OutFile $outputPath
Start-Process -FilePath msiexec.exe -Args "/package $outputPath /quiet" -Wait

# Install AZ Cli
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; remove-item .\AzureCLI.msi




