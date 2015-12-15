package bguiz.struct.sort;

class MergeSortArray {
  public static function outPlace <T>(array: Array<T>, comparator: T -> T-> Int): Array<T> {
    if (array.length < 2) {
      return array;
    }
    // split array to left and right halves
    var midIdx:Int = Std.int(array.length / 2);
    var leftArray:Array<T> = array.slice(0, midIdx);
    var rightArray:Array<T> = array.slice(midIdx, array.length);
    // recur
    leftArray = MergeSortArray.outPlace(leftArray, comparator);
    rightArray = MergeSortArray.outPlace(rightArray, comparator);
    // merge
    var out:Array<T> = new Array<T>();
    var leftIdx:Int = 0;
    var rightIdx:Int = 0;
    var outIdx:Int = 0;
    while (outIdx < array.length) {
      if (leftIdx >= leftArray.length) {
        // add the remainder of the right array to the out array
        while (outIdx < array.length) {
          out.push(rightArray[rightIdx]);
          ++outIdx;
          ++rightIdx;
        }
      }
      else if (rightIdx >= rightArray.length) {
        // add the remainder of the left array to the out array
        while (outIdx < array.length) {
          out.push(leftArray[leftIdx]);
          ++outIdx;
          ++leftIdx;
        }
      }
      else if (comparator(leftArray[leftIdx], rightArray[rightIdx]) < 0) {
        out.push(leftArray[leftIdx]);
        ++outIdx;
        ++leftIdx;
      }
      else {
        out.push(rightArray[rightIdx]);
        ++outIdx;
        ++rightIdx;
      }
    }
    return out;
  }
}
