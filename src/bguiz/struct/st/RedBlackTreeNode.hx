package bguiz.struct.st;

@:expose("Struct.RedBlackTreeNode")
typedef RedBlackTreeNode<K,V> = {
  var key:K;
  var value:V;
  var red:Bool;
  var left:RedBlackTreeNode<K,V>;
  var right:RedBlackTreeNode<K,V>;
}
