const vscode = require('vscode');
const {
    THEME_VARIANT,
    CURSOR_BY_VARIANT,
    LINE_HIGHLIGHT_BY_VARIANT
} = require('./branding');

function getActiveVariant() {
    const themeId = vscode.workspace.getConfiguration().get('workbench.colorTheme');
    return THEME_VARIANT[themeId] || null;
}

function activate(context) {
    const onConfig = vscode.workspace.onDidChangeConfiguration((event) => {
        if (
            event.affectsConfiguration('fectionlabs') ||
            event.affectsConfiguration('workbench.colorTheme')
        ) {
            applyOptionalOverrides();
        }
    });

    context.subscriptions.push(onConfig);
    applyOptionalOverrides();
}

function applyOptionalOverrides() {
    const variant = getActiveVariant();
    const config = vscode.workspace.getConfiguration('fectionlabs');
    const workbench = vscode.workspace.getConfiguration();

    if (!variant) {
        workbench.update(
            'workbench.colorCustomizations',
            {},
            vscode.ConfigurationTarget.Global
        );
        return;
    }

    const overrides = {};

    if (config.get('enableCustomCursor')) {
        overrides['editorCursor.foreground'] = CURSOR_BY_VARIANT[variant];
    }
    if (config.get('enableLineHighlight')) {
        overrides['editor.lineHighlightBackground'] =
            LINE_HIGHLIGHT_BY_VARIANT[variant];
    }

    workbench.update(
        'workbench.colorCustomizations',
        overrides,
        vscode.ConfigurationTarget.Global
    );
}

function deactivate() {
    vscode.workspace
        .getConfiguration()
        .update(
            'workbench.colorCustomizations',
            {},
            vscode.ConfigurationTarget.Global
        );
}

module.exports = { activate, deactivate };
