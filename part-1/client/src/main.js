
import { createPinia } from 'pinia';
import { createVuetify } from 'vuetify';
import * as components from 'vuetify/components';
import * as directives from 'vuetify/directives';
import { aliases, fa } from 'vuetify/iconsets/fa';
import { createApp } from 'vue';

import '@fortawesome/fontawesome-free/css/all.css';
import 'vuetify/styles';
import './style.css';

import App from './App.vue';
import router from './router';

const pinia = createPinia();

const vuetify = createVuetify({
    components,
    directives,
    icons: {
        defaultSet: 'fa',
        aliases,
        sets: {
            fa,
        },
    }
});

const app = createApp(App);

app.use(pinia);
app.use(router);
app.use(vuetify);

app.mount('#app');
