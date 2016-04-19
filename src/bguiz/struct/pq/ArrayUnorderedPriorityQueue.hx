package bguiz.struct.pq;

import bguiz.struct.pq.ArrayPriorityQueue;
import bguiz.struct.sort.SortUtil;

@:expose("Struct.ArrayUnorderedPriorityQueue")
class ArrayUnorderedPriorityQueue<T> {
  public static function insert <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int,
    value: T): Void {
    pq.data.push(value);
  }

  public static function deleteTop <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int): T {
    top(pq, comparator);
    return pq.data.pop();
  }

  public static function isEmpty <T>(
    pq:ArrayPriorityQueue<T>): Bool {
    return pq.data.length == 0;
  }

  public static function top <T>(
    pq:ArrayPriorityQueue<T>, comparator: T -> T -> Int): T {
    var maxIndex = 0;
    var len:Int = pq.data.length;
    for (i  in 1 ... len) {
      if (comparator(pq.data[maxIndex], pq.data[i]) < 0) {
        maxIndex = i;
      }
    }
    SortUtil.arraySwapIndices(pq.data, maxIndex, len - 1);
    return pq.data[len - 1];
  }

  public static function size <T>(
    pq:ArrayPriorityQueue<T>): Int {
    return pq.data.length;
  }
}
