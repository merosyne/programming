onmessage = messageHandler;

function messageHandler(event) {
   postMessage(event.data + ": the response from webworker 1");
}