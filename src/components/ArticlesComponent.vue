<script lang="ts">
export default {
  props: {
    articles: Array,
  },
};
</script>

<template>
  <div class="main">
    <table>
      <tr>
        <th>ID</th>
        <th>TITLE</th>
        <th>DESCRIPTION</th>
        <th>PRICE</th>
        <th>CURRENCY</th>
        <th>BRAND</th>
        <th>Action</th>
      </tr>
      <tr v-for="article in articles" :key="article.id">
        <td class="px2">{{ article.id }}</td>
        <td class="px2">{{ article.title }}</td>
        <td class="px2">{{ article.description }}</td>
        <td class="px2">{{ article.price }}</td>
        <td class="px2">{{ article.currency }}</td>
        <td class="px2">{{ article.brand }}</td>
        <td class="px2">
          <router-link :to="{ name: 'article', params: { id: article.id } }">
            <button>Modifier</button></router-link
          >
        </td>
      </tr>
    </table>
  </div>
</template>

<style scoped>
.px2 {
  padding: 0 2rem;
}
</style>
