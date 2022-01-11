$appName = 'fs-windows-agent-2.9.0'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 
set-Location = $LocalPath
$URL = 'https://fileinstall.blob.core.windows.net/fileinstall/fs-windows-agent-2.9.0.msi'
$URLmsi = 'fs-windows-agent-2.9.0.msi'
$outputPath = $LocalPath + '\' + $URLmsi
Invoke-WebRequest -Uri $URL -OutFile $outputPath
write-host 'Starting Install fs-windows-agent-2.9.0'
Start-Process -FilePath msiexec.exe -Args "/package $outputPath" -Wait
write-host 'Finished Install the of fs-windows-agent-2.9.0'
