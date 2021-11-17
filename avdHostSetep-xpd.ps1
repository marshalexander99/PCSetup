#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install vscode -y 
choco install googlechrome -y 
choco install firefox -y
choco install dotnet -y

choco install microsoft-windows-terminal -y


# Install Powershell 7
write-host 'Customization: Install the latest Microsoft PowerShell'
$appName = 'pwsh'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath 
$pwshURL = 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/PowerShell-7.2.0-win-x64.msi'
$msi = 'pwsh.msi'
$outputPath = $LocalPath + '\' + $msi
Invoke-WebRequest -uri $pwshURL -OutFile $outputPath
Start-Process -FilePath msiexec.exe -Args "/package $outputPath /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1" -Wait

 # set regKey
 write-host 'AIB Customization: Set required regKey'
 New-Item -Path HKLM:\SOFTWARE\Microsoft -Name "Teams" 
 New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Teams -Name "IsWVDEnvironment" -Type "Dword" -Value "1"
 write-host 'AIB Customization: Finished Set required regKey'
 
 
 # install vc
 write-host 'AIB Customization: Install the latest Microsoft Visual C++ Redistributable'
 $appName = 'teams'
 $drive = 'C:\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $visCplusURL = 'https://aka.ms/vs/16/release/vc_redist.x64.exe'
 $visCplusURLexe = 'vc_redist.x64.exe'
 $outputPath = $LocalPath + '\' + $visCplusURLexe
 Invoke-WebRequest -Uri $visCplusURL -OutFile $outputPath
 write-host 'AIB Customization: Starting Install the latest Microsoft Visual C++ Redistributable'
 Start-Process -FilePath $outputPath -Args "/install /quiet /norestart /log vcdist.log" -Wait
 write-host 'AIB Customization: Finished Install the latest Microsoft Visual C++ Redistributable'
 
 
 # install webSoc svc
 write-host 'AIB Customization: Install the Teams WebSocket Service'
 $webSocketsURL = 'https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4AQBt'
 $webSocketsInstallerMsi = 'webSocketSvc.msi'
 $outputPath = $LocalPath + '\' + $webSocketsInstallerMsi
 Invoke-WebRequest -Uri $webSocketsURL -OutFile $outputPath
 Start-Process -FilePath msiexec.exe -Args "/I $outputPath /quiet /norestart /log webSocket.log" -Wait
 write-host 'AIB Customization: Finished Install the Teams WebSocket Service'
 
 # install Teams
 write-host 'AIB Customization: Install MS Teams'
 $teamsURL = 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true'
 $teamsMsi = 'teams.msi'
 $outputPath = $LocalPath + '\' + $teamsMsi
 Invoke-WebRequest -Uri $teamsURL -OutFile $outputPath
 Start-Process -FilePath msiexec.exe -Args "/I $outputPath /quiet /norestart /log teams.log ALLUSER=1 ALLUSERS=1" -Wait
 write-host 'AIB Customization: Finished Install MS Teams' 

