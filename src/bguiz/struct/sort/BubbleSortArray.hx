package bguiz.struct.sort;

class BubbleSortArray {
  public static function inPlace <T>(array: Array<T>, comparator: T -> T-> Int): Void {
    var i:Int = 0;
    while (i < array.length) {
      var j:Int = 0;
      while (j < array.length) {
        if (comparator(array[i], array[j]) < 0) {
          // swap
          var temp:T = array[i];
          array[i] = array[j];
          array[j] = temp;
        }
        ++j;
      }
      ++i;
    }
  }
}
