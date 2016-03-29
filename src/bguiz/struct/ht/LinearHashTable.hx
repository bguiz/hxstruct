package bguiz.struct.ht;

@:expose("Struct.LinearHashTable")
typedef LinearHashTable <K, V> = {
  var capacity: Int;
  var entries: haxe.ds.Vector<HashNode<K, V>>;
}
