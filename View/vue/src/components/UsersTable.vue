<template>
  <div>
    <vue-good-table :columns="columns" :rows="rows">
      <template slot="table-row" slot-scope="props">
        <span class="actions" v-if="props.column.field == 'actions'">
          <a class="btn fas fa-edit" />
          <a class="btn far fa-trash-alt" />
        </span>
      </template>
    </vue-good-table>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { VueGoodTable } from "vue-good-table";

export default {
  name: "UsersTable",

  methods: {
    ...mapActions(["fetchUsers"]),
    async loadUsers() {
      await this.fetchUsers();
      this.rows = this.getUsers;
    },
  },

  computed: mapGetters(["getUsers"]),

  created() {
    this.loadUsers();
  },

  components: {
    VueGoodTable,
  },

  data() {
    return {
      columns: [
        { label: "ID", field: "id" },
        { label: "Name", field: "name" },
        { label: "Surname", field: "surname" },
        { label: "Phone Number", field: "phoneNumber" },
        { label: "E-Mail", field: "email", type: "email" },
        { label: "Address", field: "address" },
        {
          label: "Actions",
          field: "actions",
          sortable: false,
          tdClass: "vgt-center-align",
        },
      ],
      rows: [],
    };
  },
  mounted() {
    let recaptchaScript = document.createElement("script");
    recaptchaScript.setAttribute(
      "src",
      "https://kit.fontawesome.com/a076d05399.js"
    );
    document.head.appendChild(recaptchaScript);
  },
};
</script>

<style scoped>
.fas {
  margin-right: 15px;
}
.far {
  color: red;
}
a.btn:hover {
  background-color: lightblue;
}
</style>
