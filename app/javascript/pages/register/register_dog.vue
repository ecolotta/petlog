<template>
  <div>
    <input type="text" v-model="dog.name">
    <input type="date" v-model="dog.birthday">
    <button type='submit' @click="handleCreateDog">送信</button>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  data() {
    return {
      dog: {
        name: "",
        birthday: ""
      }
    }
  },
  methods: {
    ...mapActions("usersModule",["createDog"]),
    handleCreateDog() {
      this.createDog(this.dog)
    }
  }
}
</script>