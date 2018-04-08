$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    installerType  = 'EXE'
    url            = "https://github.com/transmission-remote-gui/transgui/releases/download/v$($version)/transgui-$($version)-setup.exe"
    url64bit       = "https://github.com/transmission-remote-gui/transgui/releases/download/v$($version)/transgui-$($version)-setup.exe"
    checksum       = '0111821DA72DEA8973EF1C0C5B5F376348CA52C4B0B38A17A6CB4402B87EBD4B'
    checksum64     = '0111821DA72DEA8973EF1C0C5B5F376348CA52C4B0B38A17A6CB4402B87EBD4B'
    checksumType   = 'sha256'
    checksumType64 = 'sha256'
    silentArgs     = '/CLOSEAPPLICATIONS /verysilent'
    validExitCodes = @(0, 1603)
}
if (Get-Process $env:ChocolateyPackageName -ea SilentlyContinue) {Stop-Process -processname $env:ChocolateyPackageName}
Install-ChocolateyPackage @packageArgs
