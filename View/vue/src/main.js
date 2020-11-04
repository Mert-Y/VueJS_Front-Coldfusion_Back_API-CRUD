import Vue from "vue";
import MainView from "./MainView.vue";
import store from "./store";

import VueGoodTablePlugin from "vue-good-table";
import "vue-good-table/dist/vue-good-table.css";
Vue.use(VueGoodTablePlugin);

Vue.config.productionTip = false;

new Vue({
  store,
  render: (h) => h(MainView),
}).$mount("#app");
