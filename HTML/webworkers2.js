onmessage = messageHandler;

function messageHandler(event) {
   var obj = event.data
   console.log(obj);
   var res = {
      return_str: "Received from webworker2: " + obj.name_str
   };
   postMessage(res);
}