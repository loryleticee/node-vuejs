<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";

// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDVflh4R_KRWb7_TPG21f6GUmIszMVJNEc",
  authDomain: "steel-mantra-322916.firebaseapp.com",
  projectId: "steel-mantra-322916",
  storageBucket: "steel-mantra-322916.appspot.com",
  messagingSenderId: "517261399367",
  appId: "1:517261399367:web:3efe4a0aaab93b4c726862",
  measurementId: "G-EEHBJFXNVY"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
</script>

<template>
  <header>
    <div>
      <nav class="navbar">
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/articles">Articles</RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style>
.navbar {
  display: flex;
  justify-content: center;
  gap: 2rem;
}
.main {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>
