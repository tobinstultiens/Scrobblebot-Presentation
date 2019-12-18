<template>
  <div justify-content-center id="app">
    <v-app id="title">
      <h1 class="display-2 text-center mt-2">Scrobblebot</h1>
      <v-content>
        <!-- Provides the application the proper gutter -->
        <v-container fluid>
          <!-- If using vue-router -->
          <router-view />
        </v-container>
      </v-content>
      <SideBar />
    </v-app>
  </div>
</template>
<script>
// @ is an alias to /src
import SideBar from "@/components/SideBar.vue";

export default {
  name: "app",
  components: {
    SideBar
  }
};
</script>
