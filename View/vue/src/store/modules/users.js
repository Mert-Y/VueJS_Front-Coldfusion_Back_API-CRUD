import axios from "axios";

export default {
  modules: {},

  state: {
    users: [],
    API: {
      VUE_APP_BASE_API:
        "http://localhost:8500/WorkCube-Homework1-CRUD/Controller",
      VUE_APP_USER_API:
        "http://localhost:8500/WorkCube-Homework1-CRUD/Controller" +
        "/UserController.cfc",
    },
  },

  getters: {
    getUsers: (state) => state.users,
  },

  actions: {
    async fetchUsers({ commit, state }) {
      const response = await axios.get(
        state.API.VUE_APP_USER_API + "?method=getUsers"
      );

      commit("setUsers", response.data);
    },
  },

  mutations: {
    setUsers: (state, users) => (state.users = users),
  },
};
