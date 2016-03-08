package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.test.Foo;
import bguiz.struct.dict.ListDictionary;
using bguiz.struct.dict.ListBag;

class ListBagTest
{
  var bag:ListDictionary<Foo>;

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
      first: null,
      // last: null,
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
    bag.first = {
      item: { id: 1, size: 100 },
      next: null
    };
    Assert.areEqual(bag.isEmpty(), false);
  }

  @Test
  public function testSize():Void
  {
    Assert.areEqual(bag.size(), 0);
    bag.first = {
      item: { id: 1, size: 100 },
      next: null
    };
    Assert.areEqual(bag.size(), 1);
  }

  @Test
  public function testAdd():Void
  {
    Assert.areEqual(bag.size(), 0);
    bag.add({ id: 1, size: 100 });
    bag.add({ id: 2, size: 10 });
    bag.add({ id: 3, size: 101 });
    Assert.areEqual(bag.size(), 3);
  }
}
