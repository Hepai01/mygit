import { createStore } from 'vuex';

const store = createStore({
  state: {
    count: false,
  },
  mutations: {
    setTrue(state) {
        state.count = true;
    },
  }
});

export default store;
