# FectionLabs Themes

Premium branded themes for **VS Code**, **Cursor**, **Windsurf**, **VSCodium**, **Trae**, **Antigravity IDE**, and other VS Code-compatible editors — 12 variants with deep syntax layers and consistent FectionLabs chrome.

See **[COMPATIBLE-EDITORS.md](./COMPATIBLE-EDITORS.md)** for per-editor paths and install methods.

## Brand signature
| Token | Hex | Usage |
|-------|-----|--------|
| FectionLabs Blue | `#034972` | Chrome, keywords (light) |
| Champagne Gold | `#D4A853` | Active tab stripe, badges |
| FectionLabs Teal | `#0D9488` | Focus, accents |

## All themes
| Theme | Type | Character |
|-------|------|-----------|
| **Dark** | Dark | Rich neon syntax on deep black |
| **Light** | Light | Clean professional contrast |
| **Bright** | Light | High-contrast sky white (readable text) |
| **Verde** | Dark | Elegant forest green |
| **Midnight** | Dark | Navy & teal depth |
| **Aurora** | Dark | Violet & cyan glow |
| **Sand** | Light | Warm cream workspace |
| **Noir** | Dark | Charcoal & gold minimal |
| **Ember** | Dark | Warm copper & flame |
| **Cobalt** | Dark | Electric blue depth |
| **Blossom** | Light | Rose & burgundy pop |
| **Glacier** | Light | Icy blue clarity |

## Install (all IDEs on Windows)
```powershell
git clone https://github.com/ApiCentraal/FectionLabs-Themepack.git
cd FectionLabs-Themepack
.\install-all-ides.ps1
```

Cursor only:
```powershell
.\install-cursor.ps1
```

Reload each editor: **Developer: Reload Window** → `Ctrl+K Ctrl+T`

```json
"workbench.colorTheme": "FectionLabs Theme Bright"
```

## Settings
- `fectionlabs.enableCustomCursor`
- `fectionlabs.enableLineHighlight`

## Changelog

See [CHANGELOG.md](./CHANGELOG.md).
