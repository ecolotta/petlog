<template>
  <h1>
    <a href="/api/oauth/line">ログイン</a>
    <button @click="handleFetchUser">me!</button>
    <button @click="handleFetchUsersDog">Dog!</button>
    <router-link to='/register_dog'>
      犬
    </router-link>
  </h1>
</template>

<script>

import { mapActions } from 'vuex'
export default {
  methods: {
    ...mapActions("usersModule",["fetchUser", "fetchDog"]),
    handleFetchUser() {
      this.fetchUser()
    },
    async handleFetchUsersDog() {
      await this.fetchDog().then(res => console.log(res))
    }
  }
}
</script>