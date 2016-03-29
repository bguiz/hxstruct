package bguiz.struct.dict;

@:expose("Struct.ArrayBag")
class ArrayBag {
    public static function add<T>(
      bag: ArrayDictionary<T>, item: T): Void {
      bag.data.push(item);
      return;
    }

    public static function isEmpty<T>(
      bag: ArrayDictionary<T>): Bool {
      return bag.data.length == 0;
    }

    public static function size<T>(
      bag: ArrayDictionary<T>): Int {
      return bag.data.length;
    }
}
