<script lang="ts" setup>
import { defineProps, onMounted, ref } from "vue";

const props = defineProps({
  user: Object,
});


onMounted(() => {
  console.log("RRRR", props);
});

</script>

<template>
  <div class="main">
     <img width="300" :src="`data:image/${props.user.img_extension};base64,${props.user.img_decoded}`" />
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
