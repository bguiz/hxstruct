package bguiz.struct.dict;

class UnsortedArrayDictionary {
  public static function search<K, T :(HasId<K>)> (dict: Array<T>, id: K): T {
    for (val in dict) {
      if (val.id == id) {
        return val;
      }
    }
    return null;
  }

  public static function insert<K, T :(HasId<K>)> (dict: Array<T>, elem: T): Void {
    dict.push(elem);
  }

  public static function delete<K, T :(HasId<K>)> (dict: Array<T>, elem: T): Void {
    var i:Int = dict.length;
    while (i-- > 0) {
      if (dict[i] == elem) {
        dict.splice(i, 1);
        return;
      }
    }
  }

  public static function minimum<K, T :(HasId<K>)> (dict: Array<T>, comparator: T -> T-> Int): T {
    var minVal = null;
    for (val in dict) {
      if (minVal == null || comparator(val, minVal) < 0) {
        minVal = val;
      }
    }
    return minVal;
  }

  public static function maximum<K, T :(HasId<K>)> (dict: Array<T>, comparator: T -> T-> Int): T {
    var maxVal = null;
    for (val in dict) {
      if (maxVal == null || comparator(val, maxVal) > 0) {
        maxVal = val;
      }
    }
    return maxVal;
  }

}

typedef HasId<K> = {
  public var id(default, default): K;
}
