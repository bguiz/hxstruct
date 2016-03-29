package bguiz.struct.dict;

@:expose("Struct.ArrayQueue")
class ArrayQueue {
  public static function enqueue<T>(queue:ArrayDictionary<T>, item: T): Void {
    queue.data.push(item);
    return;
  }

  public static function dequeue<T>(queue:ArrayDictionary<T>): Null<T> {
    return queue.data.shift();
  }

  public static function peek<T>(queue:ArrayDictionary<T>): Null<T> {
    return queue.data[0];
  }

  public static function isEmpty<T>(queue:ArrayDictionary<T>): Bool {
    return queue.data.length == 0;
  }

  public static function size<T>(queue:ArrayDictionary<T>): Int {
    return queue.data.length;
  }
}
