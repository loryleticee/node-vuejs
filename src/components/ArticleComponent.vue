<script lang="ts">
export default {
  props: {
    article: Object,
  },
  emits: ["handleModifyArticle"],
  methods: {
    handleSubmit() {
      this.$emit("handleModifyArticle", this.article);
      this.modify = false;
    },
  },
  data() {
    return {
      modify: false,
    };
  },

 

};
</script>

<template>
  <div class="main">
    <div class="article-body" v-if="!modify">
      <div class="title">
        <span> Titre </span>
        <div class="d-flex flex-column">{{ article.title }}</div>
      </div>
      <div class="content">
        <span> Contenu </span>
        <div class="d-flex flex-column">{{ article.content }}</div>
      </div>
      <div class="description">
        <span> Description </span>
        <div class="d-flex flex-column">{{ article.description }}</div>
      </div>
      <div class="price">
        <span> prix </span>
        <div class="d-flex flex-column">
          {{ article.price }} {{ article.currency }}
        </div>
      </div>
      <div class="Brand">
        <span> Titre </span>
        <div class="d-flex flex-column">{{ article.brand }}</div>
      </div>
      <button @click="modify = true"><span>Modify</span></button>
    </div>
    <div class="article-body" v-else>
      <form @submit="handleSubmit" class="d-flex flex-column gap-2">
        <input type="text" v-model="article.title" />
        <input type="text" v-model="article.content" />
        <textarea v-model="article.description"></textarea>
        <input type="number" v-model="article.price" />
        <input type="text" v-model="article.brand" />
        <input type="submit" value="ENREGISTRER" />
        <button @click="modify = false" >annuler</button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.px2 {
  padding: 0 2rem;
}
.article-body {
  display: flex;
  flex-flow: column wrap;
}

.d-flex {
  display: flex;
}
.flex-column {
  flex-direction: column;
}

.gap-2 {
  gap: 2rem;
}
</style>
