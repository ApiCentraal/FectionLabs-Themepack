# Installeer fectionlabs-theme-*.vsix handmatig (Trae, Antigravity, of elke editor zonder map).
param([string]$VsixPath)

$root = $PSScriptRoot
if (-not $VsixPath) {
    $VsixPath = Get-ChildItem -Path $root -Filter 'fectionlabs-theme-*.vsix' |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName
}
if (-not (Test-Path $VsixPath)) {
    Write-Error "Geen VSIX gevonden. Run eerst: .\.cursor\skills\publish-vscode-extension\scripts\publish.ps1 -PackageOnly"
}

Write-Host "VSIX: $VsixPath"
Write-Host ""
Write-Host "Optie A - in editor: Extensions -> ... -> Install from VSIX"
Write-Host "Optie B - CLI (indien beschikbaar):"
Write-Host "  code --install-extension `"$VsixPath`" --force"
Write-Host "  cursor --install-extension `"$VsixPath`" --force"
Write-Host "  windsurf --install-extension `"$VsixPath`" --force"
Write-Host ""
Write-Host "Optie C - map kopiëren: .\install-all-ides.ps1 (maakt Trae/Antigravity mappen aan)"
