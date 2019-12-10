<template>
  <div>
    <h2>{{ msg }}</h2>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component
export default class CommandComponent extends Vue {
  @Prop() private msg!: string;
}
</script>