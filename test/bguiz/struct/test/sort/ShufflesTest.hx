package bguiz.struct.test.sort;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.sort.SortUtil;
import bguiz.struct.shuffle.SortShuffleArray;
import bguiz.struct.shuffle.KnuthShuffleArray;

class ShufflesTest {
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
    dict = [-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11];
  }

  @After
  public function tearDown():Void
  {
  }

  @Test
  public function testSortShuffle():Void
  {
    var lengthBefore = dict.length;
    SortShuffleArray.inPlaceShuffle(dict);
    Assert.areEqual(lengthBefore, dict.length);
    // Technically it is possible for the shuffle to result
    // in exactly the same input and output,
    // but the probability of this is extremely small
    Assert.isFalse(SortUtil.arrayIsSorted(dict, intComparator));
  }

  @Test
  public function testKnuthShuffle():Void
  {
    var lengthBefore = dict.length;
    KnuthShuffleArray.inPlaceShuffle(dict);
    Assert.areEqual(lengthBefore, dict.length);
    // Technically it is possible for the shuffle to result
    // in exactly the same input and output,
    // but the probability of this is extremely small
    Assert.isFalse(SortUtil.arrayIsSorted(dict, intComparator));
  }
}
