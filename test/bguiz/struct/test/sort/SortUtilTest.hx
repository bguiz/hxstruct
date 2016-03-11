package bguiz.struct.test.sort;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.sort.SortUtil;

class SortUtilTest
{
  var array:Array<Int>;

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
  public function testSwapArrayIndices():Void
  {
    array = [10,-4,1,-1,3,0,6,5,-2,-3,9,8,7,4,11,2];
    SortUtil.arraySwapIndices(array, 0, 1);
    assertArrayEqual(array, [-4,10,1,-1,3,0,6,5,-2,-3,9,8,7,4,11,2]);
    SortUtil.arraySwapIndices(array, 1, 2);
    assertArrayEqual(array, [-4,1,10,-1,3,0,6,5,-2,-3,9,8,7,4,11,2]);
    SortUtil.arraySwapIndices(array, array.length - 1, array.length - 2);
    assertArrayEqual(array, [-4,1,10,-1,3,0,6,5,-2,-3,9,8,7,4,2,11]);
  }

  @Test
  public function testIsSorted():Void
  {
    array = [10,-4,1,-1,3,0,6,5,-2,-3,9,8,7,4,11,2];
    Assert.areEqual(SortUtil.arrayIsSorted(array, SortUtilTest.intComparator), false);
    array = [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11];
    Assert.areEqual(SortUtil.arrayIsSorted(array, SortUtilTest.intComparator), true);
  }
}
