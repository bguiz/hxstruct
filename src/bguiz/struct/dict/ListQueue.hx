package bguiz.struct.dict;

@:expose("Struct.ListQueue")
class ListQueue {
  public static function enqueue<T>(queue:ListDictionary<T>, item: T): Void {
    var prevTail:ListNode<T> = queue.last;
    queue.last = {
      item: item,
      next: null,
    };
    if (queue.first == null) {
      queue.first = queue.last;
    }
    else {
      prevTail.next = queue.last;
    }
    return;
  }

  public static function dequeue<T>(queue:ListDictionary<T>): Null<T> {
    var item:T = peek(queue);
    if (item != null) {
      queue.first = queue.first.next;
    }
    if (queue.first == null) {
      queue.last = null;
    }
    return item;
  }

  public static function peek<T>(queue:ListDictionary<T>): Null<T> {
    if (queue.first == null) {
      return null;
    }
    return queue.first.item;
  }

  public static function isEmpty<T>(queue:ListDictionary<T>): Bool {
    return queue.first == null;
  }

  public static function size<T>(queue:ListDictionary<T>): Int {
    var length:Int = 0;
    var node:ListNode<T> = queue.first;
    while (node != null) {
      ++length;
      node = node.next;
    }
    return length;
  }
}
