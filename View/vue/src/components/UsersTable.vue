<template>
  <div>
    <vue-good-table
      :columns="columns"
      :rows="rows"
      :row-style-class="rowStyleClassFn"
      styleClass="vgt-table striped bordered"
    >
      <template slot="table-row" slot-scope="props">
        <span class="actions" v-if="props.column.field == 'actions'">
          <a
            class="btn fas fa-edit"
            v-on:click="onEditBtnClick(props.row.originalIndex)"
          />
          <a class="btn far fa-trash-alt" />
        </span>
        <span v-else>
          {{ props.formattedRow[props.column.field] }}
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
    onEditBtnClick(ind) {
      this.$emit("setUserForm", {
        id: this.rows[ind].id,
        name: this.rows[ind].name,
        surname: this.rows[ind].surname,
        phoneNumber: this.rows[ind].phoneNumber,
        email: this.rows[ind].email,
        address: this.rows[ind].address,
      });
    },
    rowStyleClassFn() {
      return "VGT-row";
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
