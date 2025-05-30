<template>
    <div>{{ count }}</div>
  </template>
  
  <script setup>
  import { useStore } from 'vuex';
  
  const store = useStore();
  const count = store.state.count;
  </script>
  