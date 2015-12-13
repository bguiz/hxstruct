package bguiz.struct.dict;

class UnsortedArrayDictionary {
  public static function search<K, T :(HasId<K>)> (dict: Array<T>, id: K): T {
    for (v in dict) {
      if (v.id == id) {
        return v;
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

}

typedef HasId<K> = {
  public var id(default, default): K;
}
