<script setup>
import { onMounted, ref } from 'vue';
import { useCounterStore } from '@/stores';
import { useTheme } from 'vuetify';

const API_URL = 'https://localhost:8443/api';

const theme = useTheme();
const counterStore = useCounterStore();

const message = ref('');

onMounted(async () => {
    const response = await fetch(`${API_URL}/hello_world`);
    const json = await response.json();
    message.value = json.message;
});

function onToggleThemeSwitchClick() {
    theme.global.name.value = theme.global.current.value.dark ? 'light' : 'dark';
}
</script>

<template>
    <v-container class="fill-height text-center">
      <div
        class="align-center fill-height mx-auto"
      >
        <div class="d-flex justify-end mb-12">
            <v-switch :label="theme.global.current.value.dark ? 'dark': 'light'" inset @click="onToggleThemeSwitchClick" />
        </div>

        <div class="text-center">
          <h1 class="text-h2 font-weight-bold">{{ message }}</h1>
        </div>
  
        <div class="py-4" />
  
        <v-row>
          <v-col cols="12">
            <v-card
              class="px-4 py-6"
              color="surface-variant"
              prepend-icon="fas fa-rocket"
              rounded="lg"
              variant="outlined"
            >
              <template #title>
                <h2 class="text-h5 font-weight-bold">Get started</h2>
              </template>
  
              <template #text>
                <div class="welcome-message">
                    Welcome to our demo page! The message <v-kbd>{{ message }}</v-kbd> is stored in database and fetched dynamically from <a :href="`${API_URL}/docs`">the API</a>.
                </div>
              </template>
            </v-card>
          </v-col>

          <v-col cols="12" class="py-8">
            <div>This counter is stored in a Pinia store: </div>
            <div class="text-h5 font-weight-bold py-2">
                {{ counterStore.counter }}
            </div>
            <v-btn
                append-icon="far fa-plus"
                @click="() => counterStore.increment()"
            >Increment</v-btn>
        </v-col>
        </v-row>
    </div>
    </v-container>
</template>

<style scoped>
.welcome-message {
    line-height: 2rem;
}
</style>
