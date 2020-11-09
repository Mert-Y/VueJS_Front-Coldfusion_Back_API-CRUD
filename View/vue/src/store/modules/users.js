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

    async addUser({ commit, state }, user) {
      var response = await axios
        .post(state.API.VUE_APP_USER_API + "?method=addUser", user)
        .then(function(response) {
          user.id = response.headers.userid;
          commit("newUser", user);
          return response;
        })
        .catch(function(error) {
          return error.response;
        });
      return response;
    },
    async updateUser({ commit, state }, user) {
      //Implement later
      var response = await axios
        .post(state.API.VUE_APP_USER_API + "?method=updateUser", user)
        .then(function(response) {
          user.id = response.headers.userid;
          commit("newUser", user);
          return response.statusText;
        })
        .catch(function(error) {
          return error.response.statusText;
        });
      return response;
    },
    async deleteUser({ commit, state }, id) {
      var response = await axios
        .post(state.API.VUE_APP_USER_API + "?method=deleteUser", { id })
        .then(function(response) {
          commit("deleteUser", id);
          return response;
        })
        .catch(function(error) {
          return error.response;
        });
      return response;
    },
  },

  mutations: {
    setUsers: (state, users) => (state.users = users),
    newUser: (state, user) => {
      state.users.push(user);
    },
    deleteUser: (state, id) => {
      state.users = state.users.filter((user) => user.id != id);
    },
  },
};
