package bguiz.struct.dict;

@:expose("Struct.ListDictionary")
typedef ListDictionary<T> = {
  var first:ListNode<T>;
  @:optional var last:ListNode<T>;
}
