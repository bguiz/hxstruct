package bguiz.struct.dict;

class ListBag {
    public static function add<T>(bag: ListDictionary<T>, item: T): Void {
      var prevHead:ListNode<T> = bag.first;
      bag.first = {
        item: item,
        next: prevHead,
      };
      return;
    }

    public static function isEmpty<T>(bag: ListDictionary<T>): Bool {
      return bag.first == null;
    }

    public static function size<T>(bag: ListDictionary<T>): Int {
      var length:Int = 0;
      var node:ListNode<T> = bag.first;
      while (node != null) {
        length += 1;
        node = node.next;
      }
      return length;
    }
}
