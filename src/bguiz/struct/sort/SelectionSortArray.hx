package bguiz.struct.sort;

class SelectionSortArray {
  public static function inPlace <T>(array: Array<T>, comparator: T -> T-> Int): Void {
    var i:Int = 0;
    while (i < array.length) {
      var min:T = array[i];
      var minIndex:Int = i;
      var j:Int = i + 1;
      while (j < array.length) {
        // select the minimum in the remainder of the array
        if (comparator(array[j], min) < 0) {
          min = array[j];
          minIndex = j;
        }
        ++j;
      }
      if (min != array[i]) {
        // swap them
        var temp:T = array[i];
        array[i] = array[minIndex];
        array[minIndex] = temp;
      }
      ++i;
    }
  }
}
