<template>
  <div class="wrapper">
    <div class="inner">
      <form name="userForm" method="post" @submit="onUserFormSubmit">
        <h3>User Form</h3>
        <div class="form-wrapper">
          <label>Name:</label>
          <input v-model="user.name" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Surname:</label>
          <input v-model="user.surname" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Phone Number:</label>
          <input v-model="user.phoneNumber" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>E-mail: </label>
          <input v-model="user.email" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Address: </label>
          <input v-model="user.address" type="text" class="form-control" />
        </div>
        <div class="btn-wrapper">
          <button ref="userFormSubmitBtn" type="submit" value="Create">
            Create
          </button>
          <button
            ref="userFormClearBtn"
            type="reset"
            value="Clear"
            v-on:click="resetForm"
          >
            Clear
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "UserForm",
  data() {
    return {
      selectedID: -1,
      user: this.newUser(),
      responseTxt: "",
    };
  },
  methods: {
    newUser() {
      return { name: "", surname: "", phoneNumber: "", email: "", address: "" };
    },

    ...mapActions(["addUser", "updateUser"]),
    async onUserFormSubmit(e) {
      e.preventDefault();
      var btnText = this.$refs.userFormSubmitBtn.innerText;

      if (btnText.toLowerCase() == "create") {
        var response = await this.addUser(this.user);
        this.$emit("setResponseMessage", response);
        if (response.status == 201) this.resetForm();
      } else if (btnText.toLowerCase() == "update") {
        response = await this.updateUser({
          id: this.selectedID,
          name: this.user.name,
          surname: this.user.surname,
          phoneNumber: this.user.phoneNumber,
          email: this.user.email,
          address: this.user.address,
        });
        this.$emit("setResponseMessage", response);
      }
    },
    setUserForm(user) {
      this.user = user;
      this.selectedID = user.id;
      this.$refs.userFormSubmitBtn.innerText = "Update";
    },
    resetForm() {
      this.selectedID = -1;
      this.user = this.newUser();
      this.$refs.userFormSubmitBtn.innerText = "Create";
    },
  },
};
</script>

<style scoped>
* {
  box-sizing: border-box;
}

body {
  color: #666;
  font-size: 13px;
  margin: 0;
}

.inner {
  width: 90%;
}

input,
textarea,
select,
button {
  color: #333;
  font-size: 13px;
}

.btn-wrapper {
  display: flex;
}
:focus {
  outline: none;
}
.wrapper {
  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding-top: 60px;
}

.form-group {
  display: flex;
}
.form-group .form-wrapper {
  width: 50%;
}
.form-group .form-wrapper:first-child {
  margin-right: 20px;
}

.form-wrapper {
  margin-bottom: 17px;
}
.form-wrapper label {
  margin-bottom: 9px;
  display: block;
}

.form-control {
  border: 1px solid #ccc;
  display: block;
  width: 100%;
  height: 40px;
  padding: 0 20px;
  border-radius: 20px;
  background: none;
}
.form-control:focus {
  border: 1px solid #ae3c33;
}
button {
  border: none;
  width: 152px;
  height: 40px;
  margin: auto;
  margin-top: 29px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  background: #ae3c33;
  font-size: 13px;
  color: #fff;
  text-transform: uppercase;
  border-radius: 20px;
  overflow: hidden;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  position: relative;
  -webkit-transition-property: color;
  transition-property: color;
  -webkit-transition-duration: 0.5s;
  transition-duration: 0.5s;
}
button:before {
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: #f11a09;
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 0 50%;
  transform-origin: 0 50%;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.5s;
  transition-duration: 0.5s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
button:hover:before {
  -webkit-transform: scaleX(1);
  transform: scaleX(1);
  -webkit-transition-timing-function: cubic-bezier(0.52, 1.64, 0.37, 0.66);
  transition-timing-function: cubic-bezier(0.52, 1.64, 0.37, 0.66);
}
</style>
