import { defineStore } from 'pinia'

export const useMainStore = defineStore({
  id: 'main',
  state: () => ({
    articles: []
  }),
  persist: true,
  getters: {
    getArticles: (state) => state.articles
  }
})
