package bguiz.struct.sort;

import bguiz.struct.sort.SortUtil;

class QuickSortArray {
  /**
   * - ~1.39N*lgN execution time:
   *   - comparisons: ??? best, 2N*lgN average, 0.5*N^2 worst
   *   - swaps: ??? best, 0.33N*lgN average, ??? worst
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T-> Int): Void {
    inPlaceSortRange(array, comparator, 0, array.length - 1);
  }

  public static function inPlaceSortRange <T>(
    arr: Array<T>, comparator: T -> T-> Int,
    low:Int, high:Int): Void {
    //TODO shuffle the array first, for a probabilistic guarantee
    // against the worst case number of comparisons,
    // which is of quadratic order
    var len:Int = arr.length;
    if (high <= low) {
      return;
    }
    if (!ComparatorNetworkSortArray.inPlaceSortRange(
        arr, comparator, low, high)) {
      // Optimisation: If the range to be sorted is small,
      // palm off this portion of the work to a simpler sort algorithm
      // as the computational costs of the divide and conquer techniques
      // begin to outweigh their benefits

      var mid:Int = SortUtil.arrayMedianOf3Index(arr, comparator, low, high);
      SortUtil.arraySwapIndices(arr, low, mid);
      // Optimisation: Find the median of 3 elements from the array,
      // and swap that into the middle of the array
      // as this makes the partitioning algorithm more efficient
      // by selecting a better pivot (amortised)

      mid = partitionRange(arr, comparator, low, high);
      inPlaceSortRange(arr, comparator, low, mid-1);
      inPlaceSortRange(arr, comparator, mid+1, high);
    }
  }

  public static function inPlaceThreeWaySortRange <T>(
    array: Array<T>, comparator: T -> T -> Int,
    low, high): Void {
    if (high < low) {
      return;
    }
    var lessThan:Int = low;
    var moreThan:Int = high;
    var val = array[low];
    var i:Int = low;
    while (i <= moreThan) {
      switch (comparator(array[i], val)) {
        case c if (c < 0):
          SortUtil.arraySwapIndices(array, lessThan, i);
          ++lessThan;
          ++i;
        case c if (c > 0):
          SortUtil.arraySwapIndices(array, i, moreThan);
          --moreThan;
        case _:
          ++i;
      }
    }

    inPlaceSortRange(array, comparator, low, lessThan-1);
    inPlaceSortRange(array, comparator, moreThan+1, high);
  }

  public static function inPlaceSelect <T>(
    array: Array<T>, comparator: T -> T -> Int,
    position: Int): T {
    //TODO shuffle the array first, for a probabilistic guarantee
    // against the worst case number of comparisons,
    // which is of quadratic order
    var low:Int = 0;
    var high:Int = array.length - 1;
    while (high > low) {
      // Repeatedly partition until the (position)th smallest
      // element is at (position) index
      var mid:Int = partitionRange(array, comparator, low, high);
      if (mid < position) {
        low = mid + 1;
      }
      else if (mid > position) {
        high = mid - 1;
      }
      else {
        return array[position];
      }
    }
    return array[position];
  }

  private static function partitionRange <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int, high: Int): Int {
    var i:Int = low;
    var j:Int = high + 1;

    while (true) {
      while (comparator(arr[++i], arr[low]) < 0) {
        if (i == high) {
          break;
        }
      }
      while (comparator(arr[low], arr[--j]) < 0) {
        if (j == low) {
          break;
        }
      }
      if (i >= j) {
        break;
      }
      SortUtil.arraySwapIndices(arr, i, j);
    }

    SortUtil.arraySwapIndices(arr, low, j);
    return j;
  }
}
