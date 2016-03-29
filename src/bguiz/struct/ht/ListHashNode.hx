package  bguiz.struct.ht;

@:expose("Struct.ListHashNode")
typedef ListHashNode<K, V> = {
  > HashNode<K, V>,
  var next: ListHashNode<K, V>;
}
