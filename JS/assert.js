function assert ( str, expr ) {
   if (!expr) {
      test_out("<div class=\"fail\">&nbsp;&nbsp;Failure: " + str + "</div>");
   } else {
      test_out("<div class=\"success\">&nbsp;&nbsp;Success: " + str + "</div>");
   }
}
function test_label( label ) {
   test_out("<br><div class=\"label\">"+label+"</div>");
}
function test_out(str) {
   var out = document.getElementById("out");
   out.innerHTML += str;
}