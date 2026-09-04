# llama-cpp-updater.ps1
# Fetches the latest release and replaces only the llama.cpp binaries in-place

$githubApi = "https://api.github.com/repos/abetlen/llama.cpp/releases/latest"
$response = Invoke-RestMethod -Uri $githubApi

if (-not $response) {
    Write-Error "Failed to fetch latest release from GitHub API. Aborting."
    exit 1
}

$archiveName = $response.assets | Where-Object { $_.name -match 'llama-bin-win-avx2-x64\.zip' } | Select-Object -First 1
if (-not $archiveName) {
    Write-Error "No llama-bin-win-avx2-x64.zip found in latest release. Aborting."
    exit 1
}

# Check if llama.cpp is already installed (look for key binaries)
$alreadyInstalled = Test-Path (Join-Path $PSScriptRoot "llama-server.exe")

Write-Host "Latest release: $($response.tag_name)" -ForegroundColor Cyan
if ($alreadyInstalled) {
    Write-Host "llama.cpp is already installed. Replacing binaries..." -ForegroundColor Yellow
} else {
    Write-Host "Installing fresh llama.cpp v$($response.tag_name)" -ForegroundColor Cyan
}
Write-Host "Downloading $archiveName..." -ForegroundColor Yellow

$downloadUrl = $response.browser_download_url
$tempPath = Join-Path $env:TEMP ([System.IO.Path]::GetRandomFileName())
try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath
} catch {
    Write-Error "Failed to download $archiveName: $_"
    exit 1
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($tempPath)

foreach ($entry in $zip.Entries) {
    if ($entry.Name.EndsWith('.dll') -or $entry.Name.EndsWith('.exe')) {
        # Skip any nested paths that would land inside a subdirectory
        if ($entry.Name -notmatch '^llama/') {
            $target = $entry.FullName.Replace($tempPath, '')
            $dir = Split-Path -Parent -Path $target
            if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
            $entry.ExtractToFile($target)
        }
    }
}

$zip.Dispose()
Remove-Item $tempPath

if ($alreadyInstalled) {
    Write-Host "Binary update complete." -ForegroundColor Green
} else {
    Write-Host "Installation complete." -ForegroundColor Green
}
