$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = 'https://github.com/transmission-remote-gui/transgui/releases/download/v5.18.0/transgui-5.18.0-setup.exe'
    url64bit       = 'https://github.com/transmission-remote-gui/transgui/releases/download/v5.18.0/transgui-5.18.0-setup_64bit.exe'
    checksum       = '07CC99294C83D2AE429033ABBDB99642F5271984966616FB2C319F087448C936'
    checksum64     = 'BC625C3E32979FDDC9F30FB352843AD0AF2537F331ADDD59DD819381DF07B425'
    checksumType   = 'sha256'
    checksumType64 = 'sha256'
    silentArgs     = '/CLOSEAPPLICATIONS /verysilent'
    validExitCodes = @(0, 1603)
    softwareName   = 'Transmission Remote GUI*'
}
if (Get-Process $env:ChocolateyPackageName -ea SilentlyContinue) {Stop-Process -processname $env:ChocolateyPackageName}
Install-ChocolateyPackage @packageArgs
