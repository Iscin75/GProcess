import Vue from 'vue'
import Router from 'vue-router'
import Auth from '@/components/Auth'
import MainMenu from '@/components/MainMenu'

Vue.use(Router)



export const router = new Router({
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
      
    }
    
  ]
});

router.beforeEach((to, from, next) => {
  
  const loginPage = ['/login'];
  const authRequired = !loginPage.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  if(authRequired && !loggedIn)
  {
    return next({
      path:'/login',
      query: {returnUrl: to.path}
    });
  }
  next();
});

