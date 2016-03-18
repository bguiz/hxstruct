package bguiz.struct.test.st;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.st.BinaryTree;
using bguiz.struct.st.BinarySearchTree;

class BinarySearchTreeTest {
  var st:BinaryTree<Int, String>;

  static function intComparator(a: Int, b: Int): Int {
    return a - b;
  }

  public function new() {
  }

  @Before
  public function setup():Void {
    st = {
      root: null,
    };
  }

  @Test
  public function testGetWhenEmpty():Void {
    Assert.isNull(st.get(intComparator, 10));
  }
}
