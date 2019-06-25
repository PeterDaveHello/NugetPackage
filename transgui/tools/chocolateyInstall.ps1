$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = 'https://github.com/transmission-remote-gui/transgui/releases/download/v5.17.0/transgui-5.17.0-setup.exe'
    checksum       = '9944fb4d0b7937c4fd57767857482d2d64a54c13eaf42af21f26c3e6845e9d0e'
    checksumType   = 'sha256'
    silentArgs     = '/CLOSEAPPLICATIONS /verysilent'
    validExitCodes = @(0, 1603)
    softwareName   = 'Transmission Remote GUI*'
}
if (Get-Process $env:ChocolateyPackageName -ea SilentlyContinue) {Stop-Process -processname $env:ChocolateyPackageName}
Install-ChocolateyPackage @packageArgs
