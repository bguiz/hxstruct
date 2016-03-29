package bguiz.struct.sort;

import bguiz.struct.sort.SortUtil;

@:expose("Struct.ShellSortArray")
class ShellSortArray {
  /**
   * - ~N^2 execution time: (??? verify this)
   *   - comparisons: ? best, 2.5*N*lgN average, N^1.5 worst
   *   - swaps: ? best, ? average, ? worst
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T -> Int): Void {
    var len:Int = array.length;
    // var i:Int = 0;
    var h:Int = 1;
    while (h < (len / 3)) {
      h = (3 * h) + 1;
    }
    while (h >= 1) {
      for (i in h ... len) {
        var j:Int = i;
        while (j >= h) {
          if (!SortUtil.arraySwapIndicesIfLess(array, comparator, j, j-h)) {
            break;
          }
          j = j - h;
        }
      }
      h = Std.int(h / 3); // h sequence is 3x + 1
    }

    return;
  }
}
