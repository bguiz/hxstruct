package bguiz.struct.test.pq;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.pq.ArrayPriorityQueue;
using bguiz.struct.pq.BinaryHeapPriorityQueue;

class BinaryHeapPriorityQueueTest
{
  var pq:ArrayPriorityQueue<Int>;

  static function intComparator(a: Int, b: Int): Int {
    return a - b;
  }

  public function new() {
  }

  @Before
  public function setup():Void {
    pq = {
      data: [-32767],
    };
  }

  public static function assertArrayEqual <T>(a: Array<T>, b: Array<T>): Void {
    Assert.areEqual(a.length, b.length);
    Assert.areEqual(a.toString(), b.toString());
    var i:Int = 0;
    while (i < a.length) {
      Assert.areEqual(a[i], b[i]);
      ++i;
    }
  }

  @Test
  public function testIsEmpty():Void {
    var isEmpty:Bool = pq.isEmpty();
    Assert.isTrue(isEmpty);
    pq.data = [-32767, 3, 1, 2];
    isEmpty = pq.isEmpty();
    Assert.isFalse(isEmpty);
  }

  @Test
  public function testSize():Void {
    var size:Int = pq.size();
    Assert.areEqual(0, size);
    pq.data = [-32767, 1,2,3];
    size = pq.size();
    Assert.areEqual(3, size);
  }

  @Test
  public function testInsert():Void {
    pq.data = [-32767, 6,5,4,3,2,1];
    pq.insert(intComparator, 7);
    Assert.areEqual(8, pq.data.length);
    // 7 gets inserted in the last position,
    // before getting promoted twice in a row,
    // and ending up in the root (top position)
    assertArrayEqual([-32767, 7,5,6,3,2,1,4], pq.data);
  }

  @Test
  public function testTop():Void {
    pq.data = [-32767, 7,6,5,4,3,2,1];
    Assert.areEqual(7, pq.top(intComparator));
  }

  @Test
  public function testDeleteTop():Void {
    pq.data = [-32767, 7,6,5,4,3,2,1];
    var topVal:Int = pq.deleteTop(intComparator);
    Assert.areEqual(7, topVal);
    // 7 gets removed from the top of the heap (in 1st position),
    // and 1 (in last position) replaces it,
    // before getting demoted to left child twice in a row
    assertArrayEqual([-32767, 6,4,5,1,3,2], pq.data);
  }
}
