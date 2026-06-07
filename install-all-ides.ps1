# Installeer FectionLabs Themes in alle VS Code-compatible editors (Windows).
# Ondersteunt: VS Code, Cursor, Windsurf, VSCodium, Trae, Antigravity IDE
param(
    [switch]$VsixOnly,
    [switch]$UseCli,  # optioneel: VSIX via code/cursor/windsurf CLI (kan hangen)
    [string[]]$Ides
)

$ErrorActionPreference = 'Stop'
$source = $PSScriptRoot
$package = Get-Content (Join-Path $source 'package.json') -Raw | ConvertFrom-Json
$version = $package.version
$extId = "$($package.publisher).$($package.name)-$version"

$ideMap = [ordered]@{
    VSCode      = Join-Path $env:USERPROFILE '.vscode\extensions'
    Cursor      = Join-Path $env:USERPROFILE '.cursor\extensions'
    Windsurf    = Join-Path $env:USERPROFILE '.windsurf\extensions'
    WindsurfAlt = Join-Path $env:USERPROFILE '.codeium\windsurf\extensions'
    VSCodium  = Join-Path $env:USERPROFILE '.vscode-oss\extensions'
    Trae        = Join-Path $env:USERPROFILE '.trae\extensions'
    Antigravity = Join-Path $env:USERPROFILE '.antigravity-ide\extensions'
    AntigravityLegacy = Join-Path $env:USERPROFILE '.antigravity\extensions'
}

function Remove-OldCopies($extensionsRoot) {
    if (-not (Test-Path $extensionsRoot)) { return }
    Get-ChildItem $extensionsRoot -Directory -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like 'pasperfection.pasperfection-theme-*' -or
        $_.Name -like 'fectionlabs.fectionlabs-theme-*'
    } | ForEach-Object {
        Remove-Item -LiteralPath $_.FullName -Recurse -Force
        Write-Host "  Verwijderd oude kopie: $($_.Name)"
    }
}

function Install-FolderCopy($extensionsRoot, $label, [switch]$CreateIfMissing) {
    if (-not (Test-Path $extensionsRoot)) {
        if ($CreateIfMissing) {
            New-Item -ItemType Directory -Path $extensionsRoot -Force | Out-Null
            Write-Host "[$label] Extensions-map aangemaakt"
        } else {
            Write-Host "[$label] Map niet gevonden - overgeslagen"
            return $false
        }
    }
    Remove-OldCopies $extensionsRoot
    $target = Join-Path $extensionsRoot $extId
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item -Path (Join-Path $source '*') -Destination $target -Recurse -Force -Exclude @(
        '.git', 'node_modules', '*.vsix', 'install-cursor.ps1', 'install-all-ides.ps1'
    )
    Write-Host "[$label] Geinstalleerd -> $target"
    return $true
}

function Get-VsixPath {
    $existing = Get-ChildItem -Path $source -Filter 'fectionlabs-theme-*.vsix' -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($existing) { return $existing.FullName }
    Write-Host 'VSIX bouwen...'
    & (Join-Path $source '.cursor\skills\publish-vscode-extension\scripts\publish.ps1') -PackageOnly
    return (Get-ChildItem -Path $source -Filter 'fectionlabs-theme-*.vsix' | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName
}

function Install-VsixCli($cliPath, $label) {
    if (-not (Test-Path $cliPath)) { return $false }
    try {
        $vsix = Get-VsixPath
        $null = & $cliPath --install-extension $vsix --force 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[$label] VSIX geinstalleerd via CLI"
            return $true
        }
    } catch {
        Write-Host "[$label] VSIX CLI overgeslagen ($($_.Exception.Message))"
    }
    return $false
}

Write-Host "FectionLabs Themes v$version"
Write-Host "Extension ID: $extId"
Write-Host ""

$installed = @()

if (-not $VsixOnly) {
    foreach ($entry in $ideMap.GetEnumerator()) {
        $name = $entry.Key
        if ($Ides.Count -gt 0 -and $Ides -notcontains $name -and $Ides -notcontains ($name -replace 'Alt|Legacy','')) {
            continue
        }
        if ($name -eq 'WindsurfAlt' -and (Test-Path $ideMap.Windsurf)) { continue }
        if ($name -eq 'AntigravityLegacy' -and (Test-Path $ideMap.Antigravity)) { continue }
        $create = $name -in @('Trae', 'Antigravity', 'AntigravityLegacy')
        if (Install-FolderCopy $entry.Value $name -CreateIfMissing:$create) { $installed += $name }
    }
}

# CLI fallback waar beschikbaar
$cliMap = @{
    VSCode   = @(
        (Join-Path ${env:ProgramFiles} 'Microsoft VS Code\bin\code.cmd'),
        (Join-Path ${env:LocalAppData} 'Programs\Microsoft VS Code\bin\code.cmd')
    )
    Cursor   = @(
        (Join-Path ${env:LocalAppData} 'Programs\cursor\resources\app\bin\cursor.cmd')
    )
    Windsurf = @(
        (Join-Path ${env:LocalAppData} 'Programs\Windsurf\bin\windsurf.cmd')
    )
}

if ($UseCli) {
    foreach ($pair in $cliMap.GetEnumerator()) {
        foreach ($cli in $pair.Value) {
            if (Test-Path $cli) {
                if (Install-VsixCli $cli $pair.Key) { break }
            }
        }
    }
}

Write-Host ""
Write-Host "Geinstalleerd in: $(if ($installed.Count) { $installed -join ', ' } else { 'geen mappen (gebruik VSIX)' })"
Write-Host ""
Write-Host "Herlaad elke editor: Developer -> Reload Window"
Write-Host "Thema kiezen: Ctrl+K Ctrl+T -> FectionLabs Theme ..."
Write-Host ""
Write-Host "Open VSX (Windsurf/VSCodium): https://open-vsx.org/extension/$($package.publisher)/$($package.name)"
Write-Host "Marketplace (VS Code/Cursor): zoek 'FectionLabs Themes'"
