<template>
  <div>
    <command-component v-for="(command) in CommandArray" :command="command" :key="command.Id" />
  </div>
</template>

<script lang="ts">
/* eslint-disable no-unused-vars */
import { Component, Prop, Vue } from "vue-property-decorator";
import { Command } from "../websockets/commandMessage";
import webstomp, { Client, Frame } from "webstomp-client";
import CommandComponent from "./CommandComponent.vue";

var url = "ws://localhost:8080/gs-guide-websocket";
@Component({
  data: () => ({
    CommandArray: []
  }),
  components: {
    "command-component": CommandComponent
  },
  created() {
    console.log("created");
    const stompClient = webstomp.client(url);
    const commandArray: Command[] = this.$data.CommandArray;
    stompClient.connect({}, () => {
      console.log("Connected!");
      stompClient.subscribe("/client/message", function(greeting) {
        const command: Command = decodeMessage(greeting.body);
        console.log(command);
        commandArray.push(command);
      });
    });
  }
})
export default class CommandListComponent extends Vue {}
function decodeMessage(json: string): Command {
  const command: Command = JSON.parse(json) as Command;
  return command;
}
</script>