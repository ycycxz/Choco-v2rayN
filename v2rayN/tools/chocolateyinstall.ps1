$ErrorActionPreference = 'Stop'

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
    $url_dl = 'https://github.com/2dust/v2rayN/releases/download/6.60/v2rayN-With-Core.zip'
}
else {
    $url_dl = 'https://mirror.ghproxy.com/https://github.com/2dust/v2rayN/releases/download/6.60/v2rayN-With-Core.zip'
}


$sha256 = "1d4be13bfdc82fe7958d2c27fa166b1e54e2d2004820229a2e24c621a3853111"

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
