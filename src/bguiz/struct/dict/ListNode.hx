package bguiz.struct.dict;

@:expose("Struct.ListNode")
typedef ListNode<T> = {
  var next:ListNode<T>;
  var item:T;
}
