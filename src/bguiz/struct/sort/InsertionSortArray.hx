package bguiz.struct.sort;

import bguiz.struct.sort.SortUtil;

class InsertionSortArray {
  /**
   * - ~N^2 execution time:
   *   - comparisons: N-1 best, 0.25*N^2 average, 0.5*n^2 worst
   *   - swaps: 0 best, 0.25*N^2 average, 0.5*n^2 worst
   * - ~N execution time.
   *   - For partially sorted arrays,
   *     where number of inversions is less than the length of the array,
   *   - Because comparisons = swaps + N - 1,
   *     and swaps < N
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T -> Int): Void {
    inPlaceSortRange(array, comparator, 0, array.length - 1);
    return;
  }

  public static function inPlaceSortRange <T>(
    array: Array<T>, comparator: T -> T -> Int,
    low: Int, high: Int): Void {
    for (i in low ... high+1) {
      var j:Int = i;
      while (j > low) {
        if (!SortUtil.arraySwapIndicesIfLess(array, comparator, j, j-1)) {
          break;
        }
        --j;
      }
    }
    return;
  }
}
