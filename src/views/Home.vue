<template>
  <div>
    <SideBar />
    <CommandComponent msg="kick1999: .fm" />
  </div>
</template>

<script>
// @ is an alias to /src
import CommandComponent from "@/components/CommandComponent.vue";
import SideBar from "@/components/SideBar.vue";

export default {
  name: "home",
  components: {
    CommandComponent,
    SideBar
  }
};
</script>
