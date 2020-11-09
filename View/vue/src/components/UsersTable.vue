<template>
  <div>
    <vue-good-table
      ref="usersTable"
      :columns="columns"
      :rows="getUsers"
      :row-style-class="rowStyleClassFn"
      styleClass="vgt-table striped bordered"
    >
      <template slot="table-row" slot-scope="props">
        <span class="actions" v-if="props.column.field == 'actions'">
          <a
            class="btn fas fa-edit"
            v-on:click="onEditBtnClick(props.row.originalIndex)"
          />
          <a
            class="btn far fa-trash-alt"
            v-on:click="onDeleteBtnClick(props.row.originalIndex)"
          />
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
    ...mapActions(["fetchUsers", "deleteUser"]),
    onEditBtnClick(ind) {
      this.$emit("setUserForm", {
        id: this.$refs.usersTable.rows[ind].id,
        name: this.$refs.usersTable.rows[ind].name,
        surname: this.$refs.usersTable.rows[ind].surname,
        phoneNumber: this.$refs.usersTable.rows[ind].phoneNumber,
        email: this.$refs.usersTable.rows[ind].email,
        address: this.$refs.usersTable.rows[ind].address,
      });
    },
    async onDeleteBtnClick(ind) {
      var response = await this.deleteUser(this.$refs.usersTable.rows[ind].id);
      this.$emit("setResponseMessage", response);
    },
    rowStyleClassFn() {
      return "VGT-row";
    },
  },

  computed: mapGetters(["getUsers"]),

  created() {
    this.fetchUsers();
  },

  components: {
    VueGoodTable,
  },

  data() {
    return {
      columns: [
        { label: "ID", field: "id", type: "number" },
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
