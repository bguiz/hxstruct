package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.test.Foo;
import bguiz.struct.dict.ListDictionary;
using bguiz.struct.dict.ListStack;

class ListStackTest
{
  var stack:ListDictionary<Foo>;

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
    stack = {
      first: null
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
    Assert.areEqual(stack.isEmpty(), true);
    stack.first = {
      item: { id: 1, size: 100 },
      next: null,
    };
    Assert.areEqual(stack.isEmpty(), false);
  }

  @Test
  public function testSize():Void
  {
    Assert.areEqual(stack.size(), 0);
    stack.first = {
      item: { id: 1, size: 100 },
      next: null,
    };
    Assert.areEqual(stack.size(), 1);
  }

  @Test
  public function testPush():Void
  {
    Assert.areEqual(stack.size(), 0);
    stack.push({ id: 1, size: 100 });
    stack.push({ id: 2, size: 10 });
    stack.push({ id: 3, size: 101 });
    Assert.areEqual(stack.size(), 3);
  }

  @Test
  public function testPop():Void
  {
    Assert.areEqual(stack.size(), 0);
    stack.push({ id: 1, size: 100 });
    Assert.areEqual(stack.size(), 1);
    var foo1:Foo = stack.pop();
    Assert.isNotNull(foo1);
    Assert.areEqual(foo1.id, 1);
    var foo0:Foo = stack.pop();
    Assert.isNull(foo0);
    Assert.areEqual(stack.size(), 0);
  }

  @Test
  public function testPeek():Void
  {
    Assert.areEqual(stack.size(), 0);
    stack.push({ id: 1, size: 100 });
    Assert.areEqual(stack.size(), 1);
    var fooPeek:Foo = stack.peek();
    Assert.isNotNull(fooPeek);
    Assert.areEqual(fooPeek.id, 1);
    Assert.areEqual(stack.size(), 1);
  }
}
