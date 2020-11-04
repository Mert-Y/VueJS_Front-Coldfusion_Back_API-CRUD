<template>
  <div class="wrapper">
    <div class="inner">
      <form name="userForm" method="post">
        <h3>User Form</h3>
        <div class="form-wrapper">
          <label>Name:</label>
          <input type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Surname:</label>
          <input type="text" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Phone Number:</label>
          <input
            type="tel"
            id="phoneNumber"
            pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
            class="form-control"
          />
        </div>
        <div class="form-wrapper">
          <label>E-mail: </label>
          <input type="email" class="form-control" />
        </div>
        <div class="form-wrapper">
          <label>Address: </label>
          <input type="text" name="address" id="address" class="form-control" />
        </div>
        <div class="btn-wrapper">
          <button id="userFormSubmitBtn" type="submit" value="Create">
            Create
          </button>
          <button id="userFormSubmitBtn" type="reset" value="Clear">
            Clear
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserForm",
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
  align-items: center;
  justify-content: center;
  height: 100%;
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
