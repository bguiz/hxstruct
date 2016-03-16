package bguiz.struct.test.pq;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.pq.ArrayPriorityQueue;
using bguiz.struct.pq.ArrayUnorderedPriorityQueue;

class ArrayUnorderedPriorityQueueTest
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
      data: [],
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
    pq.data = [1,2,3];
    isEmpty = pq.isEmpty();
    Assert.isFalse(isEmpty);
  }

  @Test
  public function testSize():Void {
    var size:Int = pq.size();
    Assert.areEqual(0, size);
    pq.data = [1,2,3];
    size = pq.size();
    Assert.areEqual(3, size);
  }

  @Test
  public function testInsert():Void {
    pq.insert(intComparator, 1);
    Assert.areEqual(1, pq.data.length);
    pq.insert(intComparator, 2);
    pq.insert(intComparator, 3);
    Assert.areEqual(3, pq.data.length);
    assertArrayEqual([1,2,3], pq.data);
  }

  @Test
  public function testTop():Void {
    pq.data = [1,3,7,6,4,2];
    Assert.areEqual(7, pq.top(intComparator));
  }

  @Test
  public function testDeleteTop():Void {
    pq.data = [1,3,7,6,4,2];
    Assert.areEqual(7, pq.deleteTop(intComparator));
    assertArrayEqual([1,3,2,6,4], pq.data);
  }
}
