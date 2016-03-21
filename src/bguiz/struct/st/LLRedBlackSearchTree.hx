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

  /*
   * ~lgN
   *
   * - average: 1.39lgN
   * - worst: N
   */
  public static function put <K, V>(
    st:RedBlackTree<K, V>, comparator: K -> K -> Int,
    key: K, value: V): Void {
    st.root = putNode(st.root, comparator, key, value);
  }

  private static function putNode <K, V>(
    node:RedBlackTreeNode<K, V>, comparator: K -> K -> Int,
    key: K, value: V): RedBlackTreeNode<K, V> {
    if (node == null) {
      return {
        key: key,
        value: value,
        left: null,
        right: null,
        red: false,
      };
    }
    switch (comparator(key, node.key)) {
      case c if (c < 0):
        node.left = putNode(node.left, comparator, key, value);
      case c if (c > 0):
        node.right = putNode(node.right, comparator, key, value);
      case _:
        node.value = value;
    }
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
    st.root = deleteNode(st.root, comparator, key);
  }

  private static function deleteNode <K, V>(
    node: RedBlackTreeNode<K, V>, comparator: K -> K -> Int,
    key: K): RedBlackTreeNode<K, V> {
    if (node == null) {
      return null;
    }
    switch(comparator(key, node.key)) {
      case c if (c < 0):
        node.left = deleteNode(node.left, comparator, key);
      case c if (c > 0):
        node.right = deleteNode(node.right, comparator, key);
      case _:
        if (node.left == null) {
          return node.right;
        }
        if (node.right == null) {
          return node.left;
        }
        // We have found a node whose key matches, and we want to delete it,
        // but it has two children,
        // so we need to find the minimum child from it's right subtree
        // to replace it
        var oldNode: RedBlackTreeNode<K, V> = node;
        node = getMinimumNode(oldNode.right);
        node.right = deleteMinimumNode(oldNode.right);
        node.left = oldNode.left;
    }
    return node;
  }

  private static function getMinimumNode <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    while (node.left != null) {
      node = node.left;
    }
    return node;
  }

  private static function getMaximumNode <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    while (node.right != null) {
      node = node.right;
    }
    return node;
  }

  private static function deleteMinimumNode <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    if (node.left == null) {
      return node.right;
    }
    node.left = deleteMinimumNode(node.left);
    return node;
  }

  private static function deleteMaximumNode <K, V>(
    node: RedBlackTreeNode<K, V>): RedBlackTreeNode<K, V> {
    if (node.right == null) {
      return node.left;
    }
    node.right = deleteMaximumNode(node.right);
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
