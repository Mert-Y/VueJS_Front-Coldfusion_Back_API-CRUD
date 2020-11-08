<template>
  <div class="wrapper">
    <div class="inner">
      <form name="userForm" method="post" @submit="onUserFormSubmit">
        <h3>User Form</h3>
        <div class="form-wrapper">
          <label>Name:</label>
          <input v-model="name" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Surname:</label>
          <input v-model="surname" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Phone Number:</label>
          <input v-model="phoneNumber" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>E-mail: </label>
          <input v-model="email" type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Address: </label>
          <input v-model="address" type="text" class="form-control" />
        </div>
        <div class="btn-wrapper">
          <button id="userFormSubmitBtn" type="submit" value="Create">
            Create
          </button>
          <button
            id="userFormClearBtn"
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
      name: "",
      surname: "",
      phoneNumber: "",
      email: "",
      address: "",
    };
  },
  methods: {
    ...mapActions(["addUser", "updateUser"]),
    onUserFormSubmit(e) {
      e.preventDefault();
      var btnText = document.getElementById("userFormSubmitBtn").innerText;
      if (btnText.toLowerCase() == "create") {
        this.addUser({
          name: this.name,
          surname: this.surname,
          phoneNumber: this.phoneNumber,
          email: this.email,
          address: this.address,
        });
      } else if (btnText.toLowerCase() == "update") {
        console.log("Not implemented");
      }
    },
    setUserForm(user) {
      this.name = user.name;
      this.surname = user.surname;
      this.phoneNumber = user.phoneNumber;
      this.email = user.email;
      this.address = user.address;

      this.selectedID = user.id;
      document.getElementById("userFormSubmitBtn").innerText = "Update";
    },
    resetForm() {
      this.selectedID = -1;
      this.name = "";
      this.surname = "";
      this.phoneNumber = "";
      this.email = "";
      this.address = "";
      document.getElementById("userFormSubmitBtn").innerText = "Create";
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
  height: 100%;
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
