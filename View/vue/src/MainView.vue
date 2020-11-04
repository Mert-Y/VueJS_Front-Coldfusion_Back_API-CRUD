<template>
  <div id="app">
    <div class="container">
      <div class="box">
        <UserForm />
      </div>
      <div class="box">
        <UsersTable />
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
.box {
  height: auto;
  width: 50vw;
  overflow: auto;
  padding: 10px;
  margin: 5px;
}
</style>
