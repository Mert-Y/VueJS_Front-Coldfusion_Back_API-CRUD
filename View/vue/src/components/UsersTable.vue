<template>
  <div>
    <vue-good-table :columns="columns" :rows="rows" />
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
      ],
      rows: [],
    };
  },
};
</script>

<style></style>
