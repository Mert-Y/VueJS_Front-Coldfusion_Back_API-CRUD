<template>
  <div id="app">
    <div class="container">
      <div class="form">
        <UserForm ref="formComponent" />
      </div>
      <div class="table">
        <UsersTable v-on:setUserForm="setUserForm" />
      </div>
    </div>
  </div>
</template>

<script>
import UserForm from "./components/UserForm.vue";
import UsersTable from "./components/UsersTable.vue";

export default {
  name: "MainView",
  components: {
    UserForm,
    UsersTable,
  },
  methods: {
    setUserForm: function (user) {
      this.$refs.formComponent.setUserForm(user);
    },
  },
};
</script>

<style>
* {
  box-sizing: border-box;
}
.container {
  display: flex;
  height: 95vh;
}
.form {
  height: auto;
  width: 40vw;
  overflow: auto;
  padding: 10px;
  margin: 5px;
}
.table {
  height: auto;
  display: flex;
  overflow: auto;
  padding: 10px;
  margin: 5px;
}
</style>
