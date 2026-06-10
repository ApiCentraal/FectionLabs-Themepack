# FectionLabs Themes

Twelve branded color themes for **VS Code**, **Cursor**, **Windsurf**, **VSCodium**, **Trae**, **Antigravity IDE**, and other VS Code-compatible editors.

## Install

- **VS Code / Cursor:** [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=fectionlabs.fectionlabs-theme)
- **Windsurf / VSCodium / Antigravity:** [Open VSX](https://open-vsx.org/extension/fectionlabs/fectionlabs-theme)

Press `Ctrl+K` → `Ctrl+T` and pick a **FectionLabs Theme …** variant.

```json
"workbench.colorTheme": "FectionLabs Theme Cobalt"
```

## Themes

| Theme | Type | Character |
|-------|------|-----------|
| **Dark** | Dark | Rich neon syntax on deep black |
| **Light** | Light | Clean professional contrast |
| **Bright** | Light | High-contrast navy text on white |
| **Verde** | Dark | Elegant forest green |
| **Midnight** | Dark | Navy and teal depth |
| **Aurora** | Dark | Violet and cyan glow |
| **Sand** | Light | Warm cream workspace |
| **Noir** | Dark | Charcoal and gold minimal |
| **Ember** | Dark | Warm copper and flame |
| **Cobalt** | Dark | Electric blue depth |
| **Blossom** | Light | Rose and burgundy accents |
| **Glacier** | Light | Cool icy clarity |

## Brand colors

| Token | Hex | Usage |
|-------|-----|--------|
| FectionLabs Blue | `#034972` | Chrome, keywords (light) |
| Champagne Gold | `#D4A853` | Active tab stripe, badges |
| FectionLabs Teal | `#0D9488` | Focus, accents |

## Settings

| Setting | Default | Description |
|---------|---------|-------------|
| `fectionlabs.enableCustomCursor` | `true` | Theme-aware cursor color |
| `fectionlabs.enableLineHighlight` | `true` | Theme-aware current-line highlight |

## Repository layout

Extension sources only — no install scripts or marketing assets:

- `fectionlabs-*-theme.json` — twelve theme definitions
- `extension.js`, `branding.js` — optional cursor and line-highlight overrides
- `icon.png` — marketplace icon
- `package.json` — extension manifest

See [COMPATIBLE-EDITORS.md](./COMPATIBLE-EDITORS.md) for per-editor install notes.

## License

MIT — see [LICENSE](./LICENSE).

Issues and theme requests: [github.com/ApiCentraal/FectionLabs-Themepack/issues](https://github.com/ApiCentraal/FectionLabs-Themepack/issues)
