package bguiz.struct.ht;

typedef LinearHashTable <K, V> = {
  var capacity: Int;
  var entries: haxe.ds.Vector<HashNode<K, V>>;
}
