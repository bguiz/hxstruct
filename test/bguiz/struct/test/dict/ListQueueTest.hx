package bguiz.struct.test.dict;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.test.Foo;
import bguiz.struct.dict.ListDictionary;
using bguiz.struct.dict.ListQueue;

class ListQueueTest
{
  var queue:ListDictionary<Foo>;

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
    queue = {
      first: null,
      last: null,
    };
  }

  @After
  public function tearDown():Void
  {
  }

  @Test
  public function testEmpty():Void
  {
    Assert.areEqual(queue.isEmpty(), true);
    queue.first = {
      item: { id: 1, size: 100 },
      next: null,
    };
    Assert.areEqual(queue.isEmpty(), false);
  }

  @Test
  public function testSize():Void
  {
    Assert.areEqual(queue.size(), 0);
    queue.first = {
      item: { id: 1, size: 100 },
      next: {
        item: { id: 2, size: 10 },
        next: null,
      },
    };
    queue.last = queue.first.next;
    Assert.areEqual(queue.size(), 2);
  }

  @Test
  public function testEnqueue():Void
  {
    Assert.areEqual(queue.size(), 0);
    queue.enqueue({ id: 1, size: 100 });
    queue.enqueue({ id: 2, size: 10 });
    queue.enqueue({ id: 3, size: 101 });
    Assert.areEqual(queue.size(), 3);
  }

  @Test
  public function testDequeue():Void
  {
    Assert.areEqual(queue.size(), 0);
    queue.enqueue({ id: 1, size: 100 });
    queue.enqueue({ id: 2, size: 10 });
    Assert.areEqual(queue.size(), 2);
    var foo1:Foo = queue.dequeue();
    Assert.isNotNull(foo1);
    Assert.areEqual(foo1.id, 1);
    Assert.areEqual(queue.size(), 1);
    var foo2:Foo = queue.dequeue();
    Assert.isNotNull(foo2);
    Assert.areEqual(foo2.id, 2);
    Assert.areEqual(queue.size(), 0);
    var fooNull:Foo = queue.dequeue();
    Assert.isNull(fooNull);
    Assert.areEqual(queue.size(), 0);
  }

  @Test
  public function testPeek():Void
  {
    Assert.areEqual(queue.size(), 0);
    queue.enqueue({ id: 1, size: 100 });
    queue.enqueue({ id: 2, size: 10 });
    Assert.areEqual(queue.size(), 2);
    var fooPeek:Foo = queue.peek();
    Assert.isNotNull(fooPeek);
    Assert.areEqual(fooPeek.id, 1);
    Assert.areEqual(queue.size(), 2);
  }
}
