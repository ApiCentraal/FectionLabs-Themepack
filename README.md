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

## Marketing & visuals
- **Logo bron:** `assets/logo.svg` → exporteer naar `icon.png` (128×128)
- **Screenshots:** open `marketing/gallery.html` in de browser (1280×800 per slide)
- **Logo-tools:** zie `marketing/LOGO-TOOLS.md` (Figma, Canva, Recraft, …)
- **Marketplace copy:** `marketing/marketplace/DESCRIPTION.en.md`
- **Productstrategie:** `PRODUCT.md`

## Publishing
Automated publish skill: `.cursor/skills/publish-vscode-extension/`  
Docs: [VS Code Publishing](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) · [Open VSX Wiki](https://github.com/EclipseFdn/open-vsx.org/wiki/Publishing-Extensions)

```powershell
.\.cursor\skills\publish-vscode-extension\scripts\publish.ps1 -PackageOnly
$env:VSCE_PAT = "..."; $env:OVSX_PAT = "..."
.\.cursor\skills\publish-vscode-extension\scripts\publish.ps1
```

## Install (all IDEs on Windows)
```powershell
cd path\to\FectionLabsTheme
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

### 0.4.0
- Fixed **Bright** readability (white editor, `#0F1D2E` text, no washed-out lavender)
- Deepened syntax in all themes (tags, types, escapes, invalid, operators)
- Added **Ember**, **Cobalt**, **Blossom**, **Glacier**
- Full FectionLabs rebrand (`fectionlabs-*` files, `fectionlabs` publisher)
