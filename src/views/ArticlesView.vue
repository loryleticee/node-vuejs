<template>
  <div class="main">
    <h1>This is My article page</h1>
    <ArticlesComponent :articles="articles" />
  </div>

  <form @submit.prevent="handleSubmit">
    <label for="username">username</label>
    <input type="text" name="username" id="username" v-model="user.username" />
    <label for="password">Password</label>
    <input
      type="password"
      name="password"
      id="password"
      v-model="user.password"
    />
    <label for="email">Email</label>
    <input type="email" name="email" id="email" v-model="user.email" />
    <label for="image">Avatar</label>
    <input
      type="file"
      name="image"
      id="image"
      accept="image/"
      @change="onFileChange"
      ref="image"
    />
    <input type="submit" value="Register" />
  </form>
</template>

<script>
import ArticlesComponent from "@/components/ArticlesComponent.vue";
import axios from "axios";
axios.defaults.headers.post["Access-Control-Allow-Origin"] = "*";

import { useMainStore } from "@/stores/main";
import { mapWritableState } from "pinia";

export default {
  components: { ArticlesComponent },
  data() {
    return {
      user: {},
      response: "",
    };
  },
  mounted() {
    axios.get("http://127.0.0.1:90/articles").then((response) => {
      this.articles = response.data["articles"];
    });
  },
  computed: {
    ...mapWritableState(useMainStore, ["articles"]),
  },
  methods: {
    onFileChange: function () {
      const image = this.$refs.image.files[0];
      this.user.image = image;
    },
    handleSubmit: async function () {
      let formData = new FormData();
      formData.append("username", this.user.username);
      formData.append("email", this.user.email);
      formData.append("password", this.user.password);
      formData.append("image", this.user.image);
      let res = await fetch("http://localhost:90/inscription", {
        method: "POST",
        body: formData,
      })
        .then((r) => r.json())
        .catch((e) => console.log(e));
      
      if (res.error) {
        this.response = res.message;
        return;
      }
      this.response = "Registered successfully !";
    },
  },
};
</script>
<style scoped>
.main {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>
