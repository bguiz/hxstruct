package bguiz.struct.sort;

import bguiz.struct.sort.SortUtil;

class SelectionSortArray {
  /**
   * - ~N^2 execution time:
   *   - comparisons: 0.5*N^2 average
   *   - swaps: N average
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T -> Int): Void {
    var len:Int = array.length;
    for (i in 0 ... len) {
      var min:Int = i;
      for (j in i+1 ... len) {
        if (comparator(array[j], array[min]) < 0) {
          min = j;
        }
      }
      SortUtil.arraySwapIndices(array, min, i);
    }
    return;
  }
}
