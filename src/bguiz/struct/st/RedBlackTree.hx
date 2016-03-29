package bguiz.struct.st;

@:expose("Struct.RedBlackTree")
typedef RedBlackTree<K,V> = {
  var root:RedBlackTreeNode<K,V>;
}
