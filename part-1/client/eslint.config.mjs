import globals from 'globals';
import pluginJs from '@eslint/js';
import pluginVue from 'eslint-plugin-vue';

export default [
    {
        files: ['**/*.{js,mjs,cjs,vue}'],
        languageOptions: { globals: globals.browser },
        rules: {
            'no-console': 'warn',
            'semi': ['error', 'always'],
            'quotes': ['error', 'single'],
            'indent': ['error', 4]
        }
    },
    pluginJs.configs.recommended,
    ...pluginVue.configs['flat/essential'],
];