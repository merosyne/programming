if (!Debug) var Debug = {};

Debug.display_object = function(obj) {
   console.log("Properties of object: " + obj.getName());
   for (var i in obj) {
      if (obj.hasOwnProperty(i)) console.log("   "+ i +" -> " +obj[i]);
   }
}

Object.prototype.getName = function() { 
   var funcNameRegex = /function (.{1,})\(/;
   var results = (funcNameRegex).exec((this).constructor.toString());
   return (results && results.length > 1) ? results[1] : "";
};

Debug.global_timer = { };
Debug.timer_start = function(timer) {
   timer.start_time = new Date().getTime();
}
Debug.timer_end = function(timer) {
   timer.end_time = new Date().getTime();
   timer.elapsed_milliseconds = timer.end_time - timer.start_time;
   return timer.elapsed_milliseconds;
}
Debug.display_timer = function(timer) {
   var str = "Elapsed time in milliseconds: " + timer.elapsed_milliseconds;
   console.log(str);
   return str;
}