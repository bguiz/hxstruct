package bguiz.struct.test.sort;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.sort.ComparatorNetworkSortArray;

class ComparatorNetworkSortArrayTest
{
  var dict:Array<Int>;

  static function intComparator(a: Int, b: Int): Int {
    return a - b;
  }

  public function new()
  {
  }

  @BeforeClass
  public function beforeClass():Void
  {
  }

  @AfterClass
  public function afterClass():Void
  {
  }

  @Before
  public function setup():Void
  {
    dict = [10,-4,1,-1,3,0,6,5,-2,-3,9,8,7,4,11,2];
  }

  @After
  public function tearDown():Void
  {
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
  public function testSmallSortRange():Void
  {
    var accepted:Bool = ComparatorNetworkSortArray.inPlaceSortRange(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1, 5);
    Assert.isTrue(accepted);
    assertArrayEqual(dict, [10,-4,-1,0,1,3,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeRejected():Void
  {
    var accepted:Bool = ComparatorNetworkSortArray.inPlaceSortRange(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1, 10);
    Assert.isFalse(accepted);
    assertArrayEqual(dict, [10,-4,1,-1,3,0,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork2():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork2(
      dict, ComparatorNetworkSortArrayTest.intComparator, 2);
    assertArrayEqual(dict, [10,-4,-1,1,3,0,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork3():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork3(
      dict, ComparatorNetworkSortArrayTest.intComparator, 4);
    assertArrayEqual(dict, [10,-4,1,-1,0,3,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork4():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork4(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1);
    assertArrayEqual(dict, [10,-4,-1,1,3,0,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork5():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork5(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1);
    assertArrayEqual(dict, [10,-4,-1,0,1,3,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork6():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork6(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1);
    assertArrayEqual(dict, [10,-4,-1,0,1,3,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork7():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork7(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1);
    assertArrayEqual(dict, [10,-4,-1,0,1,3,5,6,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testSmallSortRangeComparatorNetwork8():Void
  {
    ComparatorNetworkSortArray.inPlaceSortRangeComparatorNetwork8(
      dict, ComparatorNetworkSortArrayTest.intComparator, 1);
    assertArrayEqual(dict, [10,-4,-2,-1,0,1,3,5,6,-3,9,8,7,4,11,2]);
  }
}
