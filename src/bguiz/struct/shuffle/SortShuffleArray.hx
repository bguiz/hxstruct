package bguiz.struct.shuffle;

import bguiz.struct.shuffle.SortShuffleNode;
import bguiz.struct.sort.InsertionSortArray;

class SortShuffleArray {
  private static function sortShuffleNodeComparator <T>(
    a: SortShuffleNode<T>, b: SortShuffleNode<T>): Int {
    return (switch (a.shuffle - b.shuffle) {
      case d if (d < 0):
        -1;
      case d if (d > 0):
        1;
      case _:
        0;
    });
  }

  public static function inPlaceShuffle <T>(
    array: Array<T>): Void {
    inPlaceShuffleRange(array, 0, array.length-1);
    return;
  }

  public static function inPlaceShuffleRange <T>(
    arr: Array<T>,
    low: Int, high: Int): Void {
    // Not really in place because it uses an intermediate auxiliary array
    // However it does modify the exisiting array rather than returning a new one
    // so it is still technicially in place
    var aux:Array<SortShuffleNode<T>> =
      [for(i in low ... high+1)
        ({
          shuffle: Math.random(),
          item: arr[i-low],
        })];

    InsertionSortArray.inPlaceSort(aux, sortShuffleNodeComparator);

    for (i in low ... high) {
      arr[low+i] = aux[i].item;
    }

    return;
  }
}
