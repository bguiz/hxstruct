package bguiz.struct.test.sort;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.sort.BubbleSortArray;
import bguiz.struct.sort.SelectionSortArray;
import bguiz.struct.sort.InsertionSortArray;
import bguiz.struct.sort.ShellSortArray;

class SortsTest
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
  public function testBubbleSort():Void
  {
    BubbleSortArray.inPlaceSort(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11]);
  }

  @Test
  public function testSelectionSort():Void
  {
    SelectionSortArray.inPlaceSort(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11]);
  }

  @Test
  public function testInsertionSort():Void
  {
    InsertionSortArray.inPlaceSort(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11]);
  }

  @Test
  public function testInsertionSortRange():Void
  {
    InsertionSortArray.inPlaceSortRange(
      dict, SortsTest.intComparator, 1, 5);
    assertArrayEqual(dict, [10,-4,-1,0,1,3,6,5,-2,-3,9,8,7,4,11,2]);
  }

  @Test
  public function testShellSort():Void
  {
    ShellSortArray.inPlaceSort(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11]);
  }
}
