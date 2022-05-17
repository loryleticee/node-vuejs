<template>
  <div class="main">
    <h1>This is my {{ current_article.title }} page</h1>
    <ArticleComponent @article_modified="modifyArticle" :article="current_article" />
  </div>
</template>

<script>
import ArticleComponent from "@/components/ArticleComponent.vue";
import axios from "axios";
axios.defaults.headers.post["Access-Control-Allow-Origin"] = "*";

import { useMainStore } from "@/stores/main";
import { mapState } from "pinia";

export default {
  components: { ArticleComponent },
  mounted() {
    this.current_article = this.articles.find((a) => {
      return a.id === Number(this.$route.params.id);
    });
  },
  computed: {
    ...mapState(useMainStore, ["articles"]),
  },
  data() {
    return {
      current_article: {},
    };
  },
  methods: {
    modifyArticle(article) {
      axios.post("http://127.0.0.1:90/article", article).then((resp) => {
        this.current_article = resp.data || [];
      });
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
