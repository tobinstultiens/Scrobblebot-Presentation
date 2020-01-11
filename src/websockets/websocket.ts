/* eslint-disable no-unused-vars */
import webstomp, { Client } from 'webstomp-client';

var url = "ws://localhost:8080/gs-guide-websocket";
let stompClient: Client;

export function connect() {
    stompClient = webstomp.client(url);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/client/message', function (greeting) {
            console.log(greeting)
        });
    });
}