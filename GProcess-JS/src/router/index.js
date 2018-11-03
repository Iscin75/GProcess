import Vue from 'vue'
import Router from 'vue-router'
import Auth from '@/components/Auth'
import MainMenu from '@/components/MainMenu'

Vue.use(Router)


const isLogged = false;

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/login',
      name: 'login',
      component: Auth,
    },
    {
      path: '/home',
      name: 'Home',
      component: MainMenu,
      meta: { requiresAuth: true },
      
    }
    
  ]
})

router.beforeEach((to, from, next) => {
  const isAuth = this.isLogged;
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
  if (requiresAuth && !isAuth) {
    next('/login');
  } 
  else if (requiresAuth && isAuth) {
    next();
  } 
  else {
    next();
  }
  });

export default router;