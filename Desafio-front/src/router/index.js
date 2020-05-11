import Vue from 'vue'
import Router from 'vue-router'
import Anagramsnew from '@/components/Anagramsnew'
import Anagrams from '@/components/Anagrams'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/new',
      name: 'Anagramsnew',
      component: Anagramsnew
    },
    {
      path: '/',
      name: 'Anagrams',
      component: Anagrams
    }
  ]
})
