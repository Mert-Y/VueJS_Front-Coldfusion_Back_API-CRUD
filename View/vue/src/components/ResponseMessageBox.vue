<template>
  <div class="response-box" ref="responseBox">
    {{ this.responseTxt }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      responseTxt: "",
      timeoutHandleId: -1,
    };
  },
  methods: {
    setResponseOutput(response) {
      this.responseTxt = response.statusText;
      if (response.status == 201) {
        this.$refs.responseBox.style.color = "green";
        this.clearResponseOutput(3000);
      } else {
        this.$refs.responseBox.style.color = "red";
        this.clearResponseOutput(5000);
      }
    },
    clearResponseOutput(ms) {
      if (this.timeoutHandleId != -1) {
        clearTimeout(this.timeoutHandleId);
      }
      this.timeoutHandleId = setTimeout(() => {
        this.responseTxt = "";
        this.timeoutHandleId = -1;
      }, ms);
    },
  },
};
</script>

<style>
.response-box {
  padding: 10px;
  font-size: 18px;
}
</style>