package bguiz.struct.st;

@:expose("Struct.BinaryTreeNode")
typedef BinaryTreeNode<K,V> = {
  var key:K;
  var value:V;
  var left:BinaryTreeNode<K,V>;
  var right:BinaryTreeNode<K,V>;
  var count:Int;
}
