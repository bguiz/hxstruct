package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.dict.UnsortedArrayDictionary;

typedef Foo = {
  public var id:Int;
  public var size: Int;
};

class UnsortedArrayDictionaryTest
{
  var dict:Array<Foo>;

  static function fooComparator(a: Foo, b: Foo): Int {
    return a.size - b.size;
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
    dict = new Array<Foo>();
    dict.push({ id: 1, size: 100 });
    dict.push({ id: 2, size: 10 });
    dict.push({ id: 3, size: 101 });
  }

  @After
  public function tearDown():Void
  {
  }

  @Test
  public function testSearch():Void
  {
    Assert.areEqual(UnsortedArrayDictionary.search(dict, 2).id, 2);
  }

  @Test
  public function testSearchAgain():Void
  {
    Assert.areEqual(UnsortedArrayDictionary.search(dict, 3).id, 3);
  }

  @Test
  public function testSearchNull():Void
  {
    Assert.areEqual(UnsortedArrayDictionary.search(dict, 4), null);
  }

  @Test
  public function testInsert():Void
  {
    Assert.areEqual(dict.length, 3);
    UnsortedArrayDictionary.insert(dict, { id: 4, size: 1 });
    UnsortedArrayDictionary.insert(dict, { id: 5, size: 1 });
    UnsortedArrayDictionary.insert(dict, { id: 6, size: 1 });
    Assert.areEqual(dict.length, 6);
  }

  @Test
  public function testDelete():Void
  {
    Assert.areEqual(dict.length, 3);
    UnsortedArrayDictionary.delete(dict, UnsortedArrayDictionary.search(dict, 3));
    Assert.areEqual(dict.length, 2);
  }

  @Test
  public function testMinimum():Void
  {
    Assert.areEqual(UnsortedArrayDictionary.minimum(dict, UnsortedArrayDictionaryTest.fooComparator).id, 2);
  }

  @Test
  public function testMaximum():Void
  {
    Assert.areEqual(UnsortedArrayDictionary.maximum(dict, UnsortedArrayDictionaryTest.fooComparator).id, 3);
  }
}
