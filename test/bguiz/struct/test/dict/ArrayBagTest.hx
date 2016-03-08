package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.test.Foo;
import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayBag;

class ArrayBagTest
{
  var bag:ArrayDictionary<Foo>;

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
    bag = {
      data: new Array<Foo>()
    };
  }

  @After
  public function tearDown():Void
  {
  }

  @Test
  public function testEmpty():Void
  {
    Assert.areEqual(bag.isEmpty(), true);
    bag.data.push({ id: 1, size: 100 });
    bag.data.push({ id: 2, size: 10 });
    bag.data.push({ id: 3, size: 101 });
    Assert.areEqual(bag.isEmpty(), false);
  }

  @Test
  public function testSize():Void
  {
    Assert.areEqual(bag.size(), 0);
    bag.data.push({ id: 1, size: 100 });
    bag.data.push({ id: 2, size: 10 });
    bag.data.push({ id: 3, size: 101 });
    Assert.areEqual(bag.size(), 3);
  }

  @Test
  public function testAdd():Void
  {
    Assert.areEqual(bag.data.length, 0);
    bag.add({ id: 1, size: 100 });
    bag.add({ id: 2, size: 10 });
    bag.add({ id: 3, size: 101 });
    Assert.areEqual(bag.data.length, 3);
  }
}
