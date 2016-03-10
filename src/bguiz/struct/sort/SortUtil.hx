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
    index1: Int, index2: Int): Void {
    if (comparator(array[index1], array[index2]) < 0) {
      SortUtil.arraySwapIndices(array, index1, index2);
    }
    return;
  }

  public static function arrayIsSorted <T>(
    array: Array<T>, comparator: T -> T-> Int): Bool {
    var i:Int = 1;
    while (i < array.length) {
      if (comparator(array[i], array[i-1]) < 0) {
        return false;
      }
      ++i;
    }
    return true;
  }
}
