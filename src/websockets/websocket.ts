import SockJS from 'sockjs-client';
import webstomp from 'webstomp-client';

var url = "http://localhost:8080/gs-guide-websocket";

export function connect(){
    var ws = new SockJS(url);
    var stompClient = webstomp.over(ws);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/client', function (greeting) {
            console.log(greeting)
        });
    });
}