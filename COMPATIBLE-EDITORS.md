# FectionLabs Themes — compatible editors

All editors below support the standard **VS Code extension format** (`package.json` + theme JSON). Install method varies.

| Editor | Extensions folder (Windows) | Primary install |
|--------|----------------------------|-----------------|
| **VS Code** | `%USERPROFILE%\.vscode\extensions` | [Marketplace](https://marketplace.visualstudio.com) |
| **Cursor** | `%USERPROFILE%\.cursor\extensions` | Marketplace or `install-all-ides.ps1` |
| **Windsurf** | `%USERPROFILE%\.windsurf\extensions` | [Open VSX](https://open-vsx.org) or VSIX |
| **VSCodium** | `%USERPROFILE%\.vscode-oss\extensions` | Open VSX only (no Microsoft Marketplace) |
| **Trae** | `%USERPROFILE%\.trae\extensions` | VSIX drag-drop or `install-all-ides.ps1` |
| **Antigravity IDE** | `%USERPROFILE%\.antigravity-ide\extensions` | Open VSX or VSIX ([docs](https://antigravitylab.net/en/articles/editor/vscode-antigravity)) |
| **Antigravity (legacy)** | `%USERPROFILE%\.antigravity\extensions` | VSIX / folder copy |

## One-command install (Windows)

```powershell
cd path\to\FectionLabsTheme
.\install-all-ides.ps1
```

Installs to every detected extensions folder on this machine.

## VSIX manual install

1. Build: `.\.cursor\skills\publish-vscode-extension\scripts\publish.ps1 -PackageOnly`
2. In editor: Extensions → `...` → **Install from VSIX**
3. Or CLI:
   - VS Code: `code --install-extension fectionlabs-theme-0.4.0.vsix --force`
   - Cursor: `cursor --install-extension fectionlabs-theme-0.4.0.vsix --force`
   - Windsurf: `windsurf --install-extension fectionlabs-theme-0.4.0.vsix --force`

## Open VSX (Windsurf, VSCodium, Antigravity)

After publish: `https://open-vsx.org/extension/fectionlabs/fectionlabs-theme`

Search **FectionLabs Themes** in the editor extension panel (Open VSX registry).

## Activate theme

`Ctrl+K` then `Ctrl+T` → pick **FectionLabs Theme Dark** (or any variant)

Or in `settings.json`:

```json
"workbench.colorTheme": "FectionLabs Theme Cobalt"
```

## macOS / Linux paths

| Editor | Path |
|--------|------|
| VS Code | `~/.vscode/extensions` |
| Cursor | `~/.cursor/extensions` |
| Windsurf | `~/.windsurf/extensions` |
| VSCodium | `~/.vscode-oss/extensions` |
| Trae | `~/.trae/extensions` |
| Antigravity IDE | `~/.antigravity-ide/extensions` |

Use `install-all-ides.sh` (same logic) when added; until then copy folder or VSIX.

## Notes

- **Cursor** uses Microsoft Marketplace — same extension ID as VS Code.
- **Windsurf / VSCodium / Antigravity** often use **Open VSX** — publish there for one-click install.
- **Trae** supports VSIX from VS Code Marketplace format; use VSIX if store search fails.
- Theme-only extensions need no special permissions beyond standard theme contribution.
