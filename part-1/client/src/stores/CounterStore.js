import { ref } from 'vue';
import { defineStore } from 'pinia';

const useCounterStore = defineStore('counter', () => {
    const counter = ref(0);

    function increment() {
        counter.value++;
    }
  
    return { counter, increment };
});

export default useCounterStore;
