package bguiz.struct.sort;

import bguiz.struct.sort.InsertionSortArray;
import bguiz.struct.sort.SortUtil;

class ComparatorNetworkSortArray {
  public static function inPlaceSortRange <T>(
    array: Array<T>, comparator: T -> T -> Int,
    low: Int, high: Int): Bool {
    switch (high - low + 1) {
      case 7:
        inPlaceSortRangeComparatorNetwork7(array, comparator, low);
      case 6:
        inPlaceSortRangeComparatorNetwork6(array, comparator, low);
      case 5:
        inPlaceSortRangeComparatorNetwork5(array, comparator, low);
      case 4:
        inPlaceSortRangeComparatorNetwork4(array, comparator, low);
      case 3:
        inPlaceSortRangeComparatorNetwork3(array, comparator, low);
      case 2:
        inPlaceSortRangeComparatorNetwork2(array, comparator, low);
      case 1:
        // do nothing
      default:
        return false;
    }
    return true;
  }

  public static function inPlaceSortRangeComparatorNetwork2 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1, low + 0);
  }

  public static function inPlaceSortRangeComparatorNetwork3 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1 , low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2 , low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2 , low + 1);
  }

  public static function inPlaceSortRangeComparatorNetwork4 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 1);
  }

  public static function inPlaceSortRangeComparatorNetwork5 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 3);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 1);
  }

  public static function inPlaceSortRangeComparatorNetwork6 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 4);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 3);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 3);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 2);
  }

  public static function inPlaceSortRangeComparatorNetwork7 <T>(
    arr: Array<T>, comparator: T -> T -> Int,
    low: Int): Void {
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 2, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 1, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 3);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 6, low + 5);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 3);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 6, low + 4);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 4);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 0);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 6, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 5, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 1);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 4, low + 2);
    SortUtil.arraySwapIndicesIfLess(arr, comparator, low + 3, low + 2);
  }
}
