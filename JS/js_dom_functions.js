var walk_the_DOM = function walk(node,func) {
   func(node);
   node = node.firstChild;
   while (node) {
      walk(node, func);
      node = node.nextSibling;
   }
}
