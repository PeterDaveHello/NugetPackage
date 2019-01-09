import-module au

$releases = 'https://github.com/transmission-remote-gui/transgui/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
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
    $url   = $download_page.links | ? href -match $re | select -Expand href -First 1 | % { 'https://github.com' + $_ }
    $version = (Split-Path $url -Parent).Split("v")[1]
    @{
        Version      = $version
        URL32        = $url
        ReleaseNotes = "https://github.com/transmission-remote-gui/transgui/releases/tag/v${version}"
    }
}

update -ChecksumFor 32
