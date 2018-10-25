import Vue from 'vue'
import Router from 'vue-router'
import Auth from '@/components/Auth'
import MainMenu from '@/components/MainMenu'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'connect',
      component: Auth,
    },
    {
      path: '/menu',
      name: 'Menu',
      component: MainMenu,
      
    }
    
  ]

  
  
})

export default router;