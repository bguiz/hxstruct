package bguiz.struct.sort;

import bguiz.struct.sort.ComparatorNetworkSortArray;

class MergeSortArray {
  /*
   * - ~N*lgN execution time
   *   - comparisons: 2N*lg2N
   */
  public static function inPlaceSort <T>(
    array: Array<T>, comparator: T -> T -> Int): Void {
    var aux:Array<T> = [for(i in 0 ... array.length) null];
    auxiliarySort(array, aux, comparator, 0, array.length-1);

    return;
  }

  public static function inPlaceBottomUpSort <T>(
    array: Array<T>, comparator: T -> T -> Int):Void {
    var aux = [for (i in 0 ... array.length) null];
    auxiliaryBottomUpSort(array, aux, comparator);

    return;
  }

  private static function auxiliaryMerge <T>(
    arr: Array<T>, aux: Array<T>, comparator: T -> T -> Int,
    low: Int, mid: Int, high: Int): Void {

    for (i in low ... high+1) {
      aux[i] = arr[i];
    }

    var half1:Int = low;
    var half2:Int = mid + 1;
    for (i in low ... high+1) {
      if (half2 > high) {
        // 2nd half has been completely merged,
        // so copy the remainder of 1st half
        arr[i] = aux[half1];
        ++half1;
      }
      else if (half1 > mid) {
        // 1st half has been completely merged,
        // so copy the remainder of the 2nd half
        arr[i] = aux[half2];
        ++half2;
      }
      else if (comparator(aux[half1], aux[half2]) < 0) {
        // 1st half at index is less than 2nd half at index,
        // so copy element at index for the 1st half
        arr[i] = aux[half1];
        ++half1;
      }
      else {
        // 2nd half at index is less than 1st half at index,
        // so copy element at index for the 2nd half
        arr[i] = aux[half2];
        ++half2;
      }
    }

    return;
  }

  private static function auxiliarySort <T>(
    arr: Array<T>, aux: Array<T>, comparator: T -> T -> Int,
    low: Int, high: Int): Void {
    if (high <= low) {
      return;
    }

    var mid:Int = Std.int((high + low) / 2);
    if (!ComparatorNetworkSortArray.inPlaceSortRange(
        arr, comparator, low, high)) {
      // Optimisation: If the range to be sorted is small,
      // palm off this portion of the work to a simpler sort algorithm
      // as the computational costs of the divide and conquer techniques
      // begin to outweigh their benefits
      auxiliarySort(arr, aux, comparator, low, mid);
      auxiliarySort(arr, aux, comparator, mid+1, high);
      if (comparator(arr[mid], arr[mid+1]) > 0) {
        // Optimisation: Only perform a merge when we know that
        // the two halves ar out of order
        // - arr[low ... mid] is sorted, and
        // - arr[mid+1 ... high] is sorted, and now also
        // - arr[mid] <= arr[mid+1]
        // Therefore, arr[low ... high] is sorted
        auxiliaryMerge(arr, aux, comparator, low, mid, high);
      }
    }

    return;
  }

  private static function auxiliaryBottomUpSort <T>(
    array: Array<T>, aux: Array<T>, comparator: T -> T -> Int): Void {
    var len:Int = array.length;
    var i:Int = 0;
    var step:Int;
    step = ComparatorNetworkSortArray.MAX_SUPPORTED_NETWORK_SIZE;
    while (i < len) {
      // Optimisation: Break up the input array into subarray that can be sorted
      // using comparator networks, and palm off this portion of the work,
      // so that we can start merging with larger blocks below
      var low:Int = i;
      var high:Int = Std.int(Math.min(low + step, len)) - 1;
      ComparatorNetworkSortArray.inPlaceSortRange(
        array, comparator, low, high);
      i = high + 1;
    }
    // Instead of divide and conquer,
    // we go from the bottom up,
    // merging adjacent elements, and then adjacent blocks of 2 elements,
    // then blocks of 4, 8, 16, etc
    // Due to the optimisation above, we do not start with a block size of 1,
    // but instead with the step size, and start doubling from that
    var size:Int = Std.int(step/2);
    while (size < len) {
      var low = 0;
      while (low < len - size) {
        var mid:Int = low + size - 1;
        var high:Int = Std.int(Math.min(low + (size * 2), len)) - 1;
        // auxiliaryMerge(array, aux, comparator, low, mid, high);
        if (comparator(array[mid], array[mid+1]) > 0) {
          // Optimisation: Only perform a mergew when we know that
          // - arr[low ... mid] is sorted, and
          // - arr[mid+1 ... high] is sorted, and now also
          // - arr[mid] <= arr[mid+1]
          // Therefore, arr[low ... high] is sorted
          auxiliaryMerge(array, aux, comparator, low, mid, high);
        }
        low = low + size * 2;
      }
      size = size * 2;
    }

    return;
  }
}
