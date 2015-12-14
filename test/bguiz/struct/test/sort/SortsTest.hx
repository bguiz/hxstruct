package bguiz.struct.test.sort;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.sort.BubbleSortArray;
import bguiz.struct.sort.SelectionSortArray;

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
    dict = [10,1,-1,3,0,6,5,-2,-3,9,8,7,4,2];
  }

  @After
  public function tearDown():Void
  {
  }

  public static function assertArrayEqual <T>(a: Array<T>, b: Array<T>): Void {
    Assert.areEqual(a.length, b.length);
    var i:Int = 0;
    while (i < a.length) {
      Assert.areEqual(a[i], b[i]);
      ++i;
    }
  }

  @Test
  public function testBubble():Void
  {
    BubbleSortArray.inPlace(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]);
  }

  @Test
  public function testSelection():Void
  {
    SelectionSortArray.inPlace(dict, SortsTest.intComparator);
    assertArrayEqual(dict, [-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]);
  }
}
