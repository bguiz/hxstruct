package bguiz.struct.test.st;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.st.RedBlackTree;
import bguiz.struct.st.RedBlackTreeNode;
using bguiz.struct.st.LLRedBlackSearchTree;

class LLRedBlackSearchTreeTest {
  var st:RedBlackTree<Int, String>;

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
        red: false,
        left: {
          key: 4,
          value: "vier",
          red: false,
          left: null,
          right: null,
        },
        right: {
          key: 12,
          value: "zwölf",
          red: false,
          left: {
            key: 10,
            value: "zehn",
            left: null,
            right: null,
            red: false,
          },
          right: {
            key: 14,
            value: "vierzehn",
            red: false,
            left: null,
            right: null,
          },
        },
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
      red: false,
      left: null,
      right: null,
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
  public function testPutInsertAtRootLeft(): Void {
    var value:String;
    var isRed:Bool;

    //test insert without any rotate
    st.put(intComparator, 1, "eins");
    value = st.root.left.left.value;
    isRed = st.root.left.left.red;
    Assert.isNotNull(value);
    Assert.areEqual(value, "eins");
    Assert.areEqual(isRed, true);
  }

  @Test
  public function testPutInsertAtRootRight(): Void {
    var value:String;
    var isRed:Bool;

    //test rotate left
    st.put(intComparator, 15, "fünfzehn");
    // trace(st);
    value = st.root.right.right.value;
    isRed = st.root.right.right.red;
    Assert.isNotNull(value);
    Assert.areEqual(value, "fünfzehn");
    Assert.areEqual(isRed, false);
    value = st.root.right.right.left.value;
    isRed = st.root.right.right.left.red;
    Assert.isNotNull(value);
    Assert.areEqual(value, "vierzehn");
    Assert.areEqual(isRed, true);
  }

  @Test
  public function testPutInsertAt3NodeLess(): Void {
    var value:String;
    var isRed:Bool;

    //test insert left of a 3-node
    st.root.left.red = true; //now 4&8 are a 3-node
    st.put(intComparator, 2, 'zwei');

    value = st.root.value;
    Assert.areEqual(value, "vier");

    value = st.root.left.value;
    isRed = st.root.left.red;
    Assert.areEqual(value, "zwei");
    Assert.isFalse(isRed);

    value = st.root.right.value;
    isRed = st.root.right.red;
    Assert.areEqual(value, "acht");
    Assert.isFalse(isRed);
  }

  @Test
  public function testPutInsertAt3NodeBetween(): Void {
    var value:String;
    var isRed:Bool;

    //test insert left of a 3-node
    st.root.left.red = true; //now 4&8 are a 3-node
    st.put(intComparator, 6, 'sechs');

    value = st.root.value;
    Assert.areEqual(value, "sechs");

    value = st.root.left.value;
    isRed = st.root.left.red;
    Assert.areEqual(value, "vier");
    Assert.isFalse(isRed);

    value = st.root.right.value;
    isRed = st.root.right.red;
    Assert.areEqual(value, "acht");
    Assert.isFalse(isRed);
  }

  @Test
  public function testPutInsertAt3NodeMore(): Void {
    var value:String;
    var isRed:Bool;

    //test insert left of a 3-node
    st.root.left.left = {
      key: 2,
      value: 'zwei',
      red: true,
      left: null,
      right: null,
    };
    // 2&4 are a 3-node

    st.put(intComparator, 6, 'sechs');

    value = st.root.value;
    Assert.areEqual(value, "acht");

    value = st.root.left.value;
    isRed = st.root.left.red;
    Assert.areEqual(value, "vier");
    Assert.isTrue(isRed);

    value = st.root.left.left.value;
    isRed = st.root.left.left.red;
    Assert.areEqual(value, "zwei");
    Assert.isFalse(isRed);

    value = st.root.left.right.value;
    isRed = st.root.left.right.red;
    Assert.areEqual(value, "sechs");
    Assert.isFalse(isRed);
  }

  @Test
  public function testPutInsertWitchBalanceCascade(): Void {
    var value:String;
    var isRed:Bool;

    //test insert a node which triggers a cascade of node rebalancing
    //(rotate left, rotate right, flip colour) on multiple levels

    st.root.right.left.red = true; //now 10&12 are a 3-node
    st.put(intComparator, 9, "neun");

    value = st.root.value;
    Assert.areEqual(value, "zehn");

    value = st.root.left.value;
    isRed = st.root.left.red;
    Assert.areEqual(value, "acht");
    Assert.isTrue(isRed);

    value = st.root.left.left.value;
    isRed = st.root.left.left.red;
    Assert.areEqual(value, "vier");
    Assert.isFalse(isRed);

    value = st.root.left.right.value;
    isRed = st.root.left.right.red;
    Assert.areEqual(value, "neun");
    Assert.isFalse(isRed);

    value = st.root.right.value;
    isRed = st.root.right.red;
    Assert.areEqual(value, "zwölf");
    Assert.isFalse(isRed);

    value = st.root.right.right.value;
    isRed = st.root.right.right.red;
    Assert.areEqual(value, "vierzehn");
    Assert.isFalse(isRed);
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
    var node:RedBlackTreeNode<Int, String>;
    var iterator:Iterator<RedBlackTreeNode<Int, String>> = st.iterator();

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
