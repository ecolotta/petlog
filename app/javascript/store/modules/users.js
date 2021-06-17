import axios from '../../plugins/axios.js'

const state = {
 currentUser: null,
};
const mutations = {
  
};
const actions = {
  fetchUser() {
    axios.get('me').then(res => console.log(res))
  }
};

const getters = {
  currentUser: state => state.currentUser
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}