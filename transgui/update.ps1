import-module au

$releases = 'https://github.com/transmission-remote-gui/transgui/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>\[Release Notes\]\().*?(\)\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re    = '\.exe$'
    $url32   = $download_page.links | ? href -match $re | select -Expand href -First 1 | % { 'https://github.com' + $_ }
    $version = (Split-Path $url32 -Parent).Split("v")[1]
    $url64   = "https://github.com/transmission-remote-gui/transgui/releases/download/v$version/transgui-$version-setup_64bit.exe"

    @{
        Version      = $version
        URL32        = $url32
        URL64        = $url64
        ReleaseNotes = "https://github.com/transmission-remote-gui/transgui/releases/tag/v${version}"
    }
}

update -ChecksumFor all
