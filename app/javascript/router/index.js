import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../pages/top/index'

Vue.use(VueRouter)

const routes = [
  { 
    path: '/', 
    component: Home,
    name: 'Index'
  },
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router