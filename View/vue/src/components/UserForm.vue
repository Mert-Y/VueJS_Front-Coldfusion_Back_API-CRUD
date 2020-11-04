<template>
  <form name="userForm" action="" method="post">
    <div class="form-group">
      <label>Name: </label>
      <input type="text" name="name" id="name" class="form-control" />
    </div>

    <div class="form-group">
      <label>Surname: </label>
      <input type="text" name="surname" id="surname" class="form-control" />
    </div>

    <div class="form-group">
      <label>Phone Number: </label>
      <input
        type="tel"
        name="phoneNumber"
        id="phoneNumber"
        pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
        class="form-control"
      />
    </div>

    <div class="form-group">
      <label>E-mail: </label>
      <input type="email" name="email" id="email" class="form-control" />
    </div>

    <div class="form-group">
      <label>Address: </label>
      <input type="text" name="address" id="address" class="form-control" />
    </div>
    <footer>
      <input id="userFormSubmitBtn" type="submit" value="Create" />
      <input id="userFormSubmitBtn" type="reset" value="Clear" />
    </footer>
  </form>
</template>

<script>
export default {
  name: "UserForm",
};
</script>

<style></style>
