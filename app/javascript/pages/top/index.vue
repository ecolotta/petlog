<template>
  <h1>
    <a href="/api/oauth/line">ログイン</a>
    <button @click="handleFetchUser">me!</button>
  </h1>
</template>

<script>

import { mapActions } from 'vuex'
export default {
  methods: {
    ...mapActions("usersModule",["fetchUser"]),
    handleFetchUser() {
      this.fetchUser()
    }
  }
}
</script>