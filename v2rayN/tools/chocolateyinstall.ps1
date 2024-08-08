$ErrorActionPreference = 'Stop'

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
    $url_dl = 'https://github.com/2dust/v2rayN/releases/download/6.55/v2rayN-With-Core.zip'
}
else {
    $url_dl = 'https://mirror.ghproxy.com/https://github.com/2dust/v2rayN/releases/download/6.55/v2rayN-With-Core.zip'
}


$sha256 = "29ffe0ef176096cd22c6001d5b875e1db94de00176d7348d7493def3f80ffef8"

$DesktopPath = [Environment]::GetFolderPath("Desktop")

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation  = "$(Get-ToolsLocation)\$env:ChocolateyPackageName"
    url64bit      = $url_dl
    checksum64    = $sha256
    checksumType  = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$DesktopPath\v2rayN.lnk" -TargetPath "$(Get-ToolsLocation)\$env:ChocolateyPackageName\v2rayN-With-Core\v2rayN.exe" -RunAsAdmin -PinToTaskbar
