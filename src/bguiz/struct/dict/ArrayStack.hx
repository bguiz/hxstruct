package bguiz.struct.dict;

@:expose("Struct.ArrayStack")
class ArrayStack {
    public static function push<T>(stack: ArrayDictionary<T>, item: T): Void {
      stack.data.push(item);
      return;
    }

    public static function pop<T>(stack: ArrayDictionary<T>): Null<T> {
      return stack.data.pop();
    }

    public static function peek<T>(stack: ArrayDictionary<T>): Null<T> {
      return stack.data[stack.data.length - 1];
    }

    public static function isEmpty<T>(stack: ArrayDictionary<T>): Bool {
      return stack.data.length == 0;
    }

    public static function size<T>(stack: ArrayDictionary<T>): Int {
      return stack.data.length;
    }
}
