
#  Install Wise Cloud
$appName = 'wisecloud'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath
$URL = 'https://stgxpdavdapps.blob.core.windows.net/apps/WiseCloudClientSetup.exe'
$URLexe = 'wisecloud.exe'
$outputPath = $LocalPath + '\' + $URLexe
Invoke-WebRequest -Uri $URL -OutFile $outputPath
write-host 'Starting Install  wisecloud'
Start-Process -FilePath $outputPath -Args "/q " -Wait
write-host 'Finished Install the of wisecloud'


# Install Mimecast
write-host 'Customization: Install Mimecast for Outlook'
$appName = 'mimecastforoutlook'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location $LocalPath 
$URL = 'https://stgxpdavdapps.blob.core.windows.net/apps/Mimecast for Outlook 7.10.0.72 (x64).msi'
$msi = 'mimecast.msi'
$outputPath = $LocalPath + '\' + $msi
Invoke-WebRequest -uri $URL -OutFile $outputPath
Start-Process -FilePath msiexec.exe -Args "/package $outputPath /quiet" -Wait