<template>
  <div id="app" class="image">
    <div class="container">
      <div class="form">
        <UserForm
          ref="formComponent"
          v-on:setResponseOutput="setResponseOutput"
        />
        <ResponseMessageBox ref="responseMessageBox" />
      </div>
      <div class="table">
        <UsersTable
          ref="usersTableComponent"
          v-on:setUserForm="setUserForm"
          v-on:setResponseOutput="setResponseOutput"
        />
      </div>
    </div>
  </div>
</template>

<script>
import UserForm from "./components/UserForm.vue";
import UsersTable from "./components/UsersTable.vue";
import ResponseMessageBox from "./components/ResponseMessageBox.vue";

export default {
  name: "MainView",
  components: {
    UserForm,
    UsersTable,
    ResponseMessageBox,
  },
  methods: {
    setUserForm: function (user) {
      this.$refs.formComponent.setUserForm(user);
    },
    setResponseOutput: function (response) {
      this.$refs.responseMessageBox.setResponseOutput(response);
    },
  },
};
</script>

<style>
* {
  box-sizing: border-box;
}
.image {
  background-image: url(./assets/main-background.jpg);
  background-size: cover;
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
