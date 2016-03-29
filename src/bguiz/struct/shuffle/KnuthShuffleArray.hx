package bguiz.struct.shuffle;

import bguiz.struct.sort.SortUtil;

@:expose("Struct.KnuthShuffleArray")
class KnuthShuffleArray {
  public static function inPlaceShuffle <T>(
    array: Array<T>): Void {
    inPlaceShuffleRange(array, 0, array.length-1);
    return;
  }

  public static function inPlaceShuffleRange <T>(
    arr: Array<T>,
    low: Int, high: Int): Void {
    for (i in low ... high+1) {
      var random = Std.random(i+1);
      SortUtil.arraySwapIndices(arr, i, random);
    }
    return;
  }
}
