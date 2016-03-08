package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.test.Foo;
import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayStack;

class ArrayStackTest
{
  var stack:ArrayDictionary<Foo>;

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
    Assert.areEqual(stack.isEmpty(), true);
    stack.data.push({ id: 1, size: 100 });
    stack.data.push({ id: 2, size: 10 });
    stack.data.push({ id: 3, size: 101 });
    Assert.areEqual(stack.isEmpty(), false);
  }

  @Test
  public function testSize():Void
  {
    Assert.areEqual(stack.size(), 0);
    stack.data.push({ id: 1, size: 100 });
    stack.data.push({ id: 2, size: 10 });
    stack.data.push({ id: 3, size: 101 });
    Assert.areEqual(stack.size(), 3);
  }

  @Test
  public function testPush():Void
  {
    Assert.areEqual(stack.data.length, 0);
    stack.push({ id: 1, size: 100 });
    stack.push({ id: 2, size: 10 });
    stack.push({ id: 3, size: 101 });
    Assert.areEqual(stack.data.length, 3);
  }

  @Test
  public function testPop():Void
  {
    Assert.areEqual(stack.data.length, 0);
    stack.push({ id: 1, size: 100 });
    stack.push({ id: 2, size: 10 });
    Assert.areEqual(stack.data.length, 2);
    var foo2:Foo = stack.pop();
    Assert.isNotNull(foo2);
    Assert.areEqual(foo2.id, 2);
    Assert.areEqual(stack.data.length, 1);
    var foo1:Foo = stack.pop();
    Assert.isNotNull(foo1);
    Assert.areEqual(foo1.id, 1);
    Assert.areEqual(stack.data.length, 0);
    var foo0:Foo = stack.pop();
    Assert.isNull(foo0);
    Assert.areEqual(stack.data.length, 0);
  }

  @Test
  public function testPeek():Void
  {
    Assert.areEqual(stack.data.length, 0);
    stack.push({ id: 1, size: 100 });
    stack.push({ id: 2, size: 10 });
    Assert.areEqual(stack.data.length, 2);
    var fooPeek:Foo = stack.peek();
    Assert.isNotNull(fooPeek);
    Assert.areEqual(fooPeek.id, 2);
    Assert.areEqual(stack.data.length, 2);
  }
}
