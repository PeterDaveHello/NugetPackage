$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = 'https://github.com/transmission-remote-gui/transgui/releases/download/v5.16.0/transgui-5.16-setup.exe'
    checksum       = '630691D1CDC62145B78B4E1578ADF0826026C3BA3A98EF1CACF23A919AEACD73'
    checksumType   = 'sha256'
    silentArgs     = '/CLOSEAPPLICATIONS /verysilent'
    validExitCodes = @(0, 1603)
    softwareName   = 'Transmission Remote GUI*'
}
if (Get-Process $env:ChocolateyPackageName -ea SilentlyContinue) {Stop-Process -processname $env:ChocolateyPackageName}
Install-ChocolateyPackage @packageArgs
