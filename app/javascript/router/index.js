import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store'
import Home from '../pages/top/index'
import RegisterDog from '../pages/register/register_dog'

Vue.use(VueRouter)

const routes = [
  { 
    path: '/', 
    component: Home,
    name: 'Index'
  },
  { 
    path: '/register_dog', 
    component: RegisterDog,
    name: 'RegisterDog',
  },
]

const router = new VueRouter({
  mode: 'history',
  routes
})

router.beforeEach((to, from, next) => {
  store.dispatch('usersModule/fetchUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'Index' });
    } else {
      next();
    }
  })
});

export default router