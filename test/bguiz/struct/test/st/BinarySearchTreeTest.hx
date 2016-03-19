package bguiz.struct.test.st;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.st.BinaryTree;
import bguiz.struct.st.BinaryTreeNode;
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
      root: {
        key: 8,
        value: "acht",
        left: {
          key: 4,
          value: "vier",
          left: null,
          right: null,
          count: 0,
        },
        right: {
          key: 12,
          value: "zwölf",
          left: {
            key: 10,
            value: "zehn",
            left: null,
            right: null,
            count: 0,
          },
          right: {
            key: 14,
            value: "vierzehn",
            left: null,
            right: null,
            count: 0,
          },
          count: 0,
        },
        count: 0,
      },
    };
  }

  @Test
  public function testGetWhenEmpty():Void {
    st.root = null;
    var value: String;
    value = st.get(intComparator, 10);
    Assert.isNull(value);
  }

  @Test
  public function testGetWith1Element():Void {
    st.root = {
      key: 10,
      value: "zehn",
      left: null,
      right: null,
      count: 0,
    };
    var value: String;
    value = st.get(intComparator, 10);
    Assert.isNotNull(value);
    Assert.areEqual(value, "zehn");
    value = st.get(intComparator, 15);
    Assert.isNull(value);
  }

  @Test
  public function testGetWithSeveralElements():Void {

    var value:String;
    value = st.get(intComparator, 8);
    Assert.isNotNull(value);
    Assert.areEqual(value, "acht");
    value = st.get(intComparator, 12);
    Assert.isNotNull(value);
    Assert.areEqual(value, "zwölf");
    value = st.get(intComparator, 4);
    Assert.isNotNull(value);
    Assert.areEqual(value, "vier");
    value = st.get(intComparator, 14);
    Assert.isNotNull(value);
    Assert.areEqual(value, "vierzehn");
    value = st.get(intComparator, 15);
    Assert.isNull(value);
  }

  @Test
  public function testPutUpdateWithSeveralElements(): Void {
    var value:String;
    st.put(intComparator, 8, "Eight");
    value = st.root.value;
    Assert.isNotNull(value);
    Assert.areEqual(value, "Eight");
    st.put(intComparator, 12, "Twelve");
    value = st.root.right.value;
    Assert.isNotNull(value);
    Assert.areEqual(value, "Twelve");
  }

  @Test
  public function testPutInsertWithSeveralElements(): Void {
    var value:String;
    st.put(intComparator, 15, "fünfzehn");
    value = st.root.right.right.right.value;
    Assert.isNotNull(value);
    Assert.areEqual(value, "fünfzehn");
    st.put(intComparator, 1, "eins");
    value = st.root.left.left.value;
    Assert.isNotNull(value);
    Assert.areEqual(value, "eins");
  }

  @Test
  public function testDeleteWithSeveralElements(): Void {
    var value:String;
    st.delete(intComparator, 12);
    value = st.root.right.value;
    Assert.isNotNull(value);
    Assert.areNotEqual(value, "zwölf");
    Assert.areEqual(value, "vierzehn");
    value = st.get(intComparator, 12);
    Assert.isNull(value);
  }

  @Test
  public function testDeleteRootNodeWithSeveralElements(): Void {
    var value:String;
    st.delete(intComparator, 8);
    value = st.root.value;
    Assert.isNotNull(value);
    Assert.areNotEqual(value, "acht");
    // Test that the minimum of the right tree of the deleted node
    // replaces the deleted node, as per the Hibbard deletion sequence
    Assert.areEqual(value, "zehn");
    value = st.get(intComparator, 8);
    Assert.isNull(value);
  }

  @Test
  public function testIteratorWithSeveralElements(): Void {
    var value:String;
    var hasNext:Bool;
    var node:BinaryTreeNode<Int, String>;
    var iterator:Iterator<BinaryTreeNode<Int, String>> = st.iterator();

    hasNext = iterator.hasNext();
    Assert.isTrue(hasNext);
    node = iterator.next();
    Assert.areEqual(node.key, 4);
    Assert.areEqual(node.value, "vier");

    hasNext = iterator.hasNext();
    Assert.isTrue(hasNext);
    node = iterator.next();
    Assert.areEqual(node.key, 8);
    Assert.areEqual(node.value, "acht");

    hasNext = iterator.hasNext();
    Assert.isTrue(hasNext);
    node = iterator.next();
    Assert.areEqual(node.key, 10);
    Assert.areEqual(node.value, "zehn");

    hasNext = iterator.hasNext();
    Assert.isTrue(hasNext);
    node = iterator.next();
    Assert.areEqual(node.key, 12);
    Assert.areEqual(node.value, "zwölf");

    hasNext = iterator.hasNext();
    Assert.isTrue(hasNext);
    node = iterator.next();
    Assert.areEqual(node.key, 14);
    Assert.areEqual(node.value, "vierzehn");

    hasNext = iterator.hasNext();
    Assert.isFalse(hasNext);
  }
}
