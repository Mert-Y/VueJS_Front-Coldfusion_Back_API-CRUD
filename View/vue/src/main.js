import Vue from "vue";
import MainView from "./MainView.vue";
import store from "./store";

Vue.config.productionTip = false;

new Vue({
  store,
  render: (h) => h(MainView),
}).$mount("#app");
