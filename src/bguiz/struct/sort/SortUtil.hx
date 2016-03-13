package bguiz.struct.sort;

class SortUtil {
  public static function arraySwapIndices <T>(
    array: Array<T>,
    index1: Int, index2: Int): Void {
    var temp:T = array[index1];
    array[index1] = array[index2];
    array[index2] = temp;
    return;
  }
  public static function arraySwapIndicesIfLess <T>(
    array: Array<T>, comparator: T -> T-> Int,
    index1: Int, index2: Int): Bool {
    if (comparator(array[index1], array[index2]) < 0) {
      SortUtil.arraySwapIndices(array, index1, index2);
      return true;
    }
    return false;
  }

  public static function arrayIsSorted <T>(
    array: Array<T>, comparator: T -> T-> Int): Bool {
    var len:Int = array.length;
    for (i in 1 ... len) {
      if (comparator(array[i], array[i-1]) < 0) {
        return false;
      }
    }
    return true;
  }

  public static function arrayMedianOf3Index <T>(
    array: Array<T>, comparator: T -> T -> Int,
    low: Int, high: Int): Int {
    var mid: Int = Std.int((low + high) / 2);
    var lowVal:T = array[low];
    var midVal:T = array[mid];
    var highVal:T = array[high];
    if (comparator(lowVal, midVal) < 0) {
      if (comparator(lowVal, highVal) >= 0) {
        return low;
      }
      else if (comparator(midVal, highVal) < 0) {
        return mid;
      }
    }
    else {
      if (comparator(lowVal, highVal) < 0) {
        return low;
      }
      else if (comparator(midVal, highVal) >= 0) {
        return mid;
      }
    }
    return high;
  }
}
