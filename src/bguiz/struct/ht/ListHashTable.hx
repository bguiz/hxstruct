package bguiz.struct.ht;

typedef ListHashTable <K, V> = {
  var capacity: Int;
  var entries: haxe.ds.Vector<ListHashNode<K, V>>;
}
