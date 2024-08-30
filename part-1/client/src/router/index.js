import { createRouter, createWebHashHistory } from 'vue-router';
import LandingPage from '@/pages/LandingPage.vue';

const router = createRouter({
    history: createWebHashHistory(),
    routes: [
        {
            name: 'Landing',
            path: '/',
            component: LandingPage
        }
    ],
});

export default router;