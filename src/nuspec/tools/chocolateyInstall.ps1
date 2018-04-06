$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    installerType  = 'EXE'
    url            = "https://github.com/transmission-remote-gui/transgui/releases/download/v$($version)/transgui-$($version)-setup.exe"
    url64bit       = "https://github.com/transmission-remote-gui/transgui/releases/download/v$($version)/transgui-$($version)-setup.exe"
    checksum       = '0BCBE23B02502417EFBB6FBD8F04DDECE39A552B622DFDD7AE24A31AA3C64D57'
    checksum64     = '0BCBE23B02502417EFBB6FBD8F04DDECE39A552B622DFDD7AE24A31AA3C64D57'
    checksumType   = 'sha256'
    checksumType64 = 'sha256'
    silentArgs     = '/CLOSEAPPLICATIONS /verysilent'
    validExitCodes = @(0, 1603)
}
if (Get-Process $env:ChocolateyPackageName -ea SilentlyContinue) {Stop-Process -processname $env:ChocolateyPackageName}
Install-ChocolateyPackage @packageArgs
