<template>
  <div>
    <CommandListComponent />
  </div>
</template>

<script>
// @ is an alias to /src
import CommandListComponent from "../components/CommandListComponent.vue";

export default {
  name: "home",
  components: {
    CommandListComponent
  }
};
</script>
