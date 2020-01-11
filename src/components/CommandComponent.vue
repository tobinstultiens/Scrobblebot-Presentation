<template>
  <div>
    <h1>{{ command.Username }}</h1>
    <h2>{{ command.Message }}</h2>
  </div>
</template>

<script lang="ts">
/* eslint-disable no-unused-vars */
import { Component, Prop, Vue } from "vue-property-decorator";
import { Command } from "../websockets/commandMessage";

var url = "ws://localhost:8080/gs-guide-websocket";
@Component({
  props: ["command"]
})
export default class CommandComponent extends Vue {}
</script>