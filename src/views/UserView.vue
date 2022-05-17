<template>
  <div class="main">
    <h1>This is a profile page</h1>
    <UserComponent :user="user" />
    {{ error }}
  </div>
</template>

<script>
import UserComponent from "@/components/user/UserComponent.vue";
import axios from "axios";
axios.defaults.headers.post["Access-Control-Allow-Origin"] = "*";

export default {
  components: { UserComponent },
  mounted() {
    this.user = this.fetchUser()
  },
  data() {
    return {
      user: {},
      error: "",
    };
  },
  methods: {
    async fetchUser() {
      var userFounded = await axios
        .get(`http://127.0.0.1:90/user/${this.$route.params.id}`)
        .then((resp) => {
          // console.log('resp.data', resp.data);
          this.user = resp.data || {};
        })
        .catch((e) => {
          if (e instanceof Object) {
            this.error = e.request.response;
          }
        });
      return userFounded;
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
