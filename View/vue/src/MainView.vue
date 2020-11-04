<template>
  <div id="app">
    <div class="wrap">
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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.wrap {
  display: flex;
  height: 95vh;
}
.box {
  height: auto;
  width: 50vw;
  background-color: gray;
  overflow: scroll;
  padding: 10px;
  margin: 5px;
}
</style>
