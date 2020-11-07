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

    async addUser(
      { commit, state },
      { name, surname, phoneNumber, email, address }
    ) {
      const response = await axios.post(
        state.API.VUE_APP_USER_API + "?method=addUser",
        {
          name,
          surname,
          phoneNumber,
          email,
          address,
        }
      );

      commit("newUser", {
        id: response.headers.userid,
        name,
        surname,
        phoneNumber,
        email,
        address,
      });
    },
  },

  mutations: {
    setUsers: (state, users) => (state.users = users),
    newUser: (state, user) => {
      state.users.push(user);
    },
  },
};
