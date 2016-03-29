package bguiz.struct.ht;

@:expose("Struct.ListHashTable")
typedef ListHashTable <K, V> = {
  var capacity: Int;
  var entries: haxe.ds.Vector<ListHashNode<K, V>>;
}
