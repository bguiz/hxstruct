package bguiz.struct.dict;

class ListStack {
    public static function push<T>(stack: ListDictionary<T>, item: T): Void {
      var prevHead:ListNode<T> = stack.first;
      stack.first = {
        item: item,
        next: prevHead,
      };
      return;
    }

    public static function pop<T>(stack: ListDictionary<T>): Null<T> {
      if (stack.first == null) {
        return null;
      }
      var item:T = stack.first.item;
      stack.first = stack.first.next;
      return item;
    }

    public static function peek<T>(stack: ListDictionary<T>): Null<T> {
      if (stack.first == null) {
        return null;
      }
      return stack.first.item;
    }

    public static function isEmpty<T>(stack: ListDictionary<T>): Bool {
      return stack.first == null;
    }

    public static function size<T>(stack: ListDictionary<T>): Int {
      var length:Int = 0;
      var node:ListNode<T> = stack.first;
      while (node != null) {
        length += 1;
        node = node.next;
      }
      return length;
    }
}
