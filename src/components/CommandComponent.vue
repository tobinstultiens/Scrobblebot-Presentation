<template>
  <div>
    <h2>{{ msg }}</h2>
    <v-btn class="primary" text @click="connectClick"></v-btn>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";
import {connect} from "@/websockets/websocket.ts"

@Component
export default class CommandComponent extends Vue {
  @Prop() private msg!: string;

  connectClick():void{
    connect();
  }
}
</script>