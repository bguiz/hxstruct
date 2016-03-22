package bguiz.struct.st;

import bguiz.struct.st.RedBlackTree;
import bguiz.struct.st.BinaryTreeNode;
import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayQueue;

class LLRedBlackSearchTree<K, V> {

  /*
   * ~lgN
   *
   * - average: 1.39lgN
   * - worst: N
   *
   *  Reference: Sedgewick https://www.cs.princeton.edu/~rs/talks/LLRB/LLRB.pdf
   */
  public static function get <K, V>(
    st:RedBlackTree<K, V>, comparator: K -> K -> Int,
    key: K): V {
    var node:RedBlackTreeNode<K, V> = st.root;
    while (node != null) {
      switch(comparator(key, node.key)) {
        case c if (c < 0):
          node = node.left;
        case c if (c > 0):
          node = node.right;
        case _:
          return node.value;
      }
    }
    return null;
  }

  private static function nodeIsRed <K, V>(
    node: RedBlackTreeNode<K, V>): Bool {
    return (node != null && node.red);
  }

  private static function nodeIsBlack <K, V>(
    node: RedBlackTreeNode<K, V>): Bool {
    return (node == null || !node.red);
  }

  private static function nodeRotateLeft <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    var promotedChild:RedBlackTreeNode<K, V> = node.right;
    node.right = promotedChild.left;
    promotedChild.left = node;
    promotedChild.red = node.red;
    node.red = true;
    return promotedChild;
  }

  private static function nodeRotateRight <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    var promotedChild:RedBlackTreeNode<K, V> = node.left;
    node.left = promotedChild.right;
    promotedChild.right = node;
    promotedChild.red = node.red;
    node.red = true;
    return promotedChild;
  }

  private static function nodeFlipColour <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    node.red = true;
    node.left.red = false;
    node.right.red = false;
    return node;
  }

  private static function nodeRebalance <K, V>(
    node: RedBlackTreeNode<K, V>,
    shouldRotateLeftWhenBlackLeft: Bool): RedBlackTreeNode<K, V> {
    if ((!shouldRotateLeftWhenBlackLeft || nodeIsBlack(node.left)) && nodeIsRed(node.right)) {
      node = nodeRotateLeft(node);
    }
    if (nodeIsRed(node.left) && nodeIsRed(node.left.left)) {
      node = nodeRotateRight(node);
    }
    if (nodeIsRed(node.left) && nodeIsRed(node.right)) {
      node = nodeFlipColour(node);
    }
    return node;
  }

  private static function nodeMoveRedLeft <K, V> (
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    node = nodeFlipColour(node);
    if (nodeIsRed(node.right.left)) {
      node.right = nodeRotateRight(node.right);
      node = nodeRotateLeft(node);
      node = nodeFlipColour(node);
    }
    return node;
  }

  private static function nodeMoveRedRight <K, V> (
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    node = nodeFlipColour(node);
    if (nodeIsRed(node.left.left)) {
      node = nodeRotateRight(node);
      node = nodeFlipColour(node);
    }
    return node;
  }

  /*
   * ~lgN
   *
   * - average: 1.39lgN
   * - worst: N
   */
  public static function put <K, V>(
    st:RedBlackTree<K, V>, comparator: K -> K -> Int,
    key: K, value: V): Void {
    st.root = nodePut(st.root, comparator, key, value);
    st.root.red = false;
  }

  private static function nodePut <K, V>(
    node:RedBlackTreeNode<K, V>, comparator: K -> K -> Int,
    key: K, value: V): RedBlackTreeNode<K, V> {
    if (node == null) {
      return {
        key: key,
        value: value,
        red: true,
        left: null,
        right: null,
      };
    }
    switch (comparator(key, node.key)) {
      case c if (c < 0):
        node.left = nodePut(node.left, comparator, key, value);
      case c if (c > 0):
        node.right = nodePut(node.right, comparator, key, value);
      case _:
        node.value = value;
    }

    node = nodeRebalance(node, true);

    return node;
  }

  /*
   * ~N^0.5
   *
   * - average: N^0.5
   * - worst: N
   *
   * This uses Hibbard deletion,
   * which leads to a height proportional to square root of N over time,
   * due to the fact that it is inherently asymmetric
   */
  public static function delete <K, V>(
    st:RedBlackTree<K, V>, comparator: K -> K -> Int,
    key: K): Void {
    st.root = nodeDelete(st.root, comparator, key);
    if (st.root != null) {
      st.root.red = false;
    }
  }

  private static function nodeDelete <K, V>(
    node: RedBlackTreeNode<K, V>, comparator: K -> K -> Int,
    key: K): RedBlackTreeNode<K, V> {
    if (comparator(key, node.key) < 0) {
      if (nodeIsBlack(node.left) && nodeIsBlack(node.left.left)) {
        node = nodeMoveRedLeft(node);
      }
      node.left = nodeDelete(node.left, comparator, key);
    }
    else {
      if (nodeIsRed(node.left)) {
        node = nodeRotateRight(node);
      }
      if (comparator(key, node.key) == 0 && node.right == null) {
        return null;
      }
      if (nodeIsBlack(node.right) && nodeIsBlack(node.right.left)) {
        node = nodeMoveRedRight(node);
      }
      if (comparator(key, node.key) == 0) {
        var minimumRightNode:RedBlackTreeNode<K, V> = nodeGetMinimum(node.right);
        node.key = minimumRightNode.key;
        node.value = minimumRightNode.value;
        node.right = nodeDeleteMinimum(node.right);
      }
      else {
        node.right = nodeDelete(node.right, comparator, key);
      }
    }
    node = nodeRebalance(node, false);
    return node;
  }

  private static function nodeGetMinimum <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    while (node.left != null) {
      node = node.left;
    }
    return node;
  }

  private static function nodeGetMaximum <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    while (node.right != null) {
      node = node.right;
    }
    return node;
  }

  private static function nodeDeleteMinimum <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    if (node.left == null) {
      return null;
    }
    if (nodeIsBlack(node.left) && nodeIsBlack(node.left.left)) {
      node = nodeMoveRedLeft(node);
    }
    node.left = nodeDeleteMinimum(node.left);
    node = nodeRebalance(node, false);
    return node;
  }

  private static function nodeDeleteMaximum <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    if (node.right == null) {
      return node.left;
    }
    node.right = nodeDeleteMaximum(node.right);
    return node;
  }

  public static function iterator <K, V>(
    st:RedBlackTree<K,V>): Iterator<RedBlackTreeNode<K, V>> {
    var queue:ArrayDictionary<RedBlackTreeNode<K, V>> = {
      data: [],
    };
    traverse(queue, st.root);
    return queue.data.iterator();
  }

  private static function traverse <K, V>(
    queue:ArrayDictionary<RedBlackTreeNode<K, V>>,
    node: RedBlackTreeNode<K, V>): Void {
    if (node == null) {
      return;
    }
    traverse(queue, node.left);
    queue.enqueue(node);
    traverse(queue, node.right);
  }
}
