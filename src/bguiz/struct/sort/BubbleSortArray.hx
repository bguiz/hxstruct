package bguiz.struct.sort;

import bguiz.struct.sort.SortUtil;

@:expose("Struct.BubbleSortArray")
class BubbleSortArray {
  /**
   * - ~N^2 execution time:
   *   - comparisons: N^2 best, N^2 average, N^2 worst
   *   - swaps: 0 best, 0.5*N^2 average, N^2 worst
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T-> Int): Void {
    var len:Int = array.length;
    for (i in 0 ... len) {
      for (j in 0 ... len) {
        SortUtil.arraySwapIndicesIfLess(array, comparator, i, j);
      }
    }
  }
}
