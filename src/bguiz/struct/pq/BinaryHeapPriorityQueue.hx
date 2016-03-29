package bguiz.struct.pq;

import bguiz.struct.pq.ArrayPriorityQueue;
import bguiz.struct.sort.SortUtil;

@:expose("Struct.BinaryHeapPriorityQueue")
class BinaryHeapPriorityQueue<T> {
  /*
   * ~logN
   */
  public static function insert <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int,
    value: T): Void {
    pq.data.push(value);
    promote(pq, comparator, pq.data.length-1);
  }

  /*
   * ~logN
   */
  public static function deleteTop <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int): T {
    var topVal:T = pq.data[1];
    pq.data[1] = pq.data.pop();
    demote(pq, comparator, 1);
    return topVal;
  }

  public static function isEmpty <T>(
    pq:ArrayPriorityQueue<T>): Bool {
    return pq.data.length < 2;
  }

  /*
   * ~1
   */
  public static function top <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int): T {
    // First index - the root node - is always the top
    return pq.data[1];
  }

  public static function size <T>(
    pq:ArrayPriorityQueue<T>): Int {
    return pq.data.length - 1;
  }

  private static function promote <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int,
    index: Int): Void {
    while (index > 1 &&
      (comparator(pq.data[Std.int(index / 2)], pq.data[index]) < 0)) {
      SortUtil.arraySwapIndices(pq.data, Std.int(index / 2), index);
      index = Std.int(index / 2);
    }
  }

  private static function demote <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int,
    index: Int): Void {
    var len:Int = pq.data.length - 1;
    while (index * 2 <= len) {
      var childIndex = index * 2;
      if (childIndex < len &&
        comparator(pq.data[childIndex], pq.data[childIndex+1]) < 0) {
        ++childIndex;
      }
      if (comparator(pq.data[index], pq.data[childIndex]) >= 0) {
        break;
      }
      SortUtil.arraySwapIndices(pq.data, index, childIndex);
      index = childIndex;
    }
  }
}
