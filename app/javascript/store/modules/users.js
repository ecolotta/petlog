import axios from '../../plugins/axios.js'

const state = {
 currentUser: null,
 currentUsersDog: null,
};
const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
  },
  setCurrentUsersDog(state, dog) {
    state.currentUsersDog = dog
  }
};
const actions = {
  async fetchUser({commit}) {
    try {
      if (state.currentUser) return state.currentUser

      const res = await axios.get('me')
      .catch(err => {
        return null
      })
      
      if (!res) return null
       
      const authUser = res.data
      if (authUser) {
        commit('setCurrentUser', authUser)
        return authUser
      } else {
        commit('setCurrentUser', null)
        return null
      } 
    } catch (err) {
      console.log(err)
    }
  },
  async fetchDog({commit}) {
    try {
      if (state.currentUsersDog) return state.currentUsersDog
      
      const res = await axios.get('my_dog')
      .catch(err => {
        return null
      })

      if (!res) return null
       
      const authDog = res.data
      if (authDog) {
        commit('setCurrentUsersDog', authDog)
        return authDog
      } else {
        commit('setCurrentUser', null)
        return null
      } 
    } catch (err) {
      console.log(err)
    }
  },
  // async fetchUser({commit}) {
  //   try {
  //     if (state.currentUser) return state.currentUser
      
  //     const res = await axios.get('me')
  //     .catch(err => {
  //       return null
  //     })

  //     if (!res) return null
       
  //     const authUser = res.data[0]
  //     const authDog = res.data[1]
  //     if (authUser) {
  //       commit('setCurrentUser', authUser)
  //       if (authDog) {
  //         commit('setCurrentUsersDog', authDog)
  //       }
  //       console.log(state.currentUser)
  //       console.log(state.currentUsersDog)
  //       return authUser
  //     } else {
  //       commit('setCurrentUser', null)
  //       return null
  //     } 
  //   } catch (err) {
  //     console.log(err)
  //   }
  // },
  createDog({commit}, dog) {
    axios.post(`users/${state.currentUser.id}/dogs`, dog).then(res => console.log(res))
  }
};

const getters = {
  currentUser: state => state.currentUser,
  currentUsersDog: state => state.currentUsersDog
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}