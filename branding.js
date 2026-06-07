/**
 * FectionLabs brand tokens — shared across all theme variants.
 * Signature: champagne gold (#D4A853) + FectionLabs blue (#034972) + teal (#0D9488).
 */
const BRAND = {
    gold: '#D4A853',
    goldMuted: '#B8923A',
    blue: '#034972',
    blueDeep: '#023556',
    teal: '#0D9488',
    tealSoft: '#5EEAD4',
    ink: '#0A0F14',
    mist: '#E8EEF2',
    forest: '#1B4332',
    forestDeep: '#0E1512',
    sage: '#DCE8E3',
    emerald: '#52B788',
    mint: '#95D5B2',
    violet: '#A78BFA',
    sand: '#F5F0E8',
    charcoal: '#121212',
    ember: '#E85D04',
    cobalt: '#60A5FA',
    blossom: '#9D174D',
    glacier: '#0369A1'
};

const THEME_VARIANT = {
    'FectionLabs Theme Dark': 'dark',
    'FectionLabs Theme Light': 'light',
    'FectionLabs Theme Bright': 'bright',
    'FectionLabs Theme Verde': 'verde',
    'FectionLabs Theme Midnight': 'midnight',
    'FectionLabs Theme Aurora': 'aurora',
    'FectionLabs Theme Sand': 'sand',
    'FectionLabs Theme Noir': 'noir',
    'FectionLabs Theme Ember': 'ember',
    'FectionLabs Theme Cobalt': 'cobalt',
    'FectionLabs Theme Blossom': 'blossom',
    'FectionLabs Theme Glacier': 'glacier'
};

const CURSOR_BY_VARIANT = {
    dark: '#F2F7FB',
    light: BRAND.blueDeep,
    bright: BRAND.blue,
    verde: BRAND.mint,
    midnight: BRAND.tealSoft,
    aurora: BRAND.violet,
    sand: BRAND.blue,
    noir: BRAND.gold,
    ember: '#FFB347',
    cobalt: BRAND.cobalt,
    blossom: BRAND.blossom,
    glacier: BRAND.glacier
};

const LINE_HIGHLIGHT_BY_VARIANT = {
    dark: '#0F1820',
    light: '#E8F4F8',
    bright: '#E8F2FA',
    verde: '#1A2E24',
    midnight: '#111A24',
    aurora: '#141E32',
    sand: '#EDE6DA',
    noir: '#1A1A1A',
    ember: '#1F1410',
    cobalt: '#0C1828',
    blossom: '#FCE8EF',
    glacier: '#E0F2FE'
};

module.exports = {
    BRAND,
    THEME_VARIANT,
    CURSOR_BY_VARIANT,
    LINE_HIGHLIGHT_BY_VARIANT
};
