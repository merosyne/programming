// !== : different value or different type
if (typeof Object.create !== "function") {
   Object.create = function (o) {
      var F = function() { };
      F.prototype = o;
      return new F();
   }
}

// Example:
//    MyConstructor.method("some_method_name", function() { ... });
//
// Apparently "Object" is a function constructor, so we can now use
// 'method' on Object, as per below.
Function.prototype.method = function (name, func) {
   if (!this.prototype[name]) {
      this.prototype[name] = func;
      return this;
   }
}

Function.method('inherits', function( Parent ) {
   this.prototype = new Parent();
   return this;
});

// Why does this now have access to 'method'?
// For some reason, object's prototype is an empty function: function() { }
if (typeof Object.superior !== "function") {
   Object.method('superior', function(name) {
      var that = this;
      var method = that[name];
      return function() { 
         return method.apply(that, arguments);
      };
   });
}
 
Function.method("curry",function() {
   var slice = Array.prototype.slice;
   
   args = slice.apply(arguments);
   that = this; // The function on which 'curry' is called.
   return function() {
      return that.apply(null,args.concat(slice.apply(arguments)));
   }
});

Number.method("integer",function() {
   return Math[this < 0 ? 'ceil' : 'floor'](this);
});

String.method("trim", function() {
   return this.replace(/^\s+|\s+$/g,"");
});

var is_array = function(value) {
   return Object.prototype.toString.apply(value) === '[object Array]';
}

// This will be called via Array.dim, not called (or inherited) as part of a new Array object.
Array.dim = function(dimension, initial) {
   var a = [], i;
   for (i = 0; i < dimension; i += 1) {
      a[i] = initial;
   }
   return a;
}

// memoizer(n): currently stores all previously computed values.
var memoizer = function (results_array, formula) {
   var recur = function(n) {
      var result = results_array[n];
      if (typeof result !== 'number') {
         result = formula(recur, n);
         results_array[n] = result;
      }
      return result;
   }
   return recur;
}