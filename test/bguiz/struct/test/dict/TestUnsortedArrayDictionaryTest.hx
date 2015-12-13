package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.dict.UnsortedArrayDictionary;

typedef Foo = {
  public var id:Int;
};

class TestUnsortedArrayDictionaryTest
{
  var dict:Array<Foo>;

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
    dict.push({ id: 1 });
    dict.push({ id: 2 });
    dict.push({ id: 3 });
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
    UnsortedArrayDictionary.insert(dict, { id: 4 });
    UnsortedArrayDictionary.insert(dict, { id: 5 });
    UnsortedArrayDictionary.insert(dict, { id: 6 });
    Assert.areEqual(dict.length, 6);
  }

  @Test
  public function testDelete():Void
  {
    Assert.areEqual(dict.length, 3);
    UnsortedArrayDictionary.delete(dict, UnsortedArrayDictionary.search(dict, 3));
    Assert.areEqual(dict.length, 2);
  }
}
