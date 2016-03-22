package bguiz.struct.st;

import bguiz.struct.st.BinaryTree;
import bguiz.struct.st.BinaryTreeNode;
import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayQueue;

class BinarySearchTree<K, V> {

  /*
   * ~lgN
   *
   * - average: 1.39lgN
   * - worst: N
   */
  public static function get <K, V>(
    st:BinaryTree<K, V>, comparator: K -> K -> Int,
    key: K): V {
    var node:BinaryTreeNode<K, V> = st.root;
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
    st:BinaryTree<K, V>, comparator: K -> K -> Int,
    key: K, value: V): Void {
    st.root = nodePut(st.root, comparator, key, value);
  }

  private static function nodePut <K, V>(
    node:BinaryTreeNode<K, V>, comparator: K -> K -> Int,
    key: K, value: V): BinaryTreeNode<K, V> {
    if (node == null) {
      return {
        key: key,
        value: value,
        left: null,
        right: null,
        count: 0,
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
    st:BinaryTree<K, V>, comparator: K -> K -> Int,
    key: K): Void {
    st.root = nodeDelete(st.root, comparator, key);
  }

  private static function nodeDelete <K, V>(
    node: BinaryTreeNode<K, V>, comparator: K -> K -> Int,
    key: K): BinaryTreeNode<K, V> {
    if (node == null) {
      return null;
    }
    switch(comparator(key, node.key)) {
      case c if (c < 0):
        node.left = nodeDelete(node.left, comparator, key);
      case c if (c > 0):
        node.right = nodeDelete(node.right, comparator, key);
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
        var oldNode: BinaryTreeNode<K, V> = node;
        node = nodeGetMinimum(oldNode.right);
        node.right = nodeDeleteMinimum(oldNode.right);
        node.left = oldNode.left;
    }
    return node;
  }

  private static function nodeGetMinimum <K, V>(
    node: BinaryTreeNode<K, V>): BinaryTreeNode<K, V> {
    while (node.left != null) {
      node = node.left;
    }
    return node;
  }

  private static function nodeGetMaximum <K, V>(
    node: BinaryTreeNode<K, V>): BinaryTreeNode<K, V> {
    while (node.right != null) {
      node = node.right;
    }
    return node;
  }

  private static function nodeDeleteMinimum <K, V>(
    node: BinaryTreeNode<K, V>): BinaryTreeNode<K, V> {
    if (node.left == null) {
      return node.right;
    }
    node.left = nodeDeleteMinimum(node.left);
    return node;
  }

  private static function nodeDeleteMaximum <K, V>(
    node: BinaryTreeNode<K, V>): BinaryTreeNode<K, V> {
    if (node.right == null) {
      return node.left;
    }
    node.right = nodeDeleteMaximum(node.right);
    return node;
  }

  public static function iterator <K, V>(
    st:BinaryTree<K,V>): Iterator<BinaryTreeNode<K, V>> {
    var queue:ArrayDictionary<BinaryTreeNode<K, V>> = {
      data: [],
    };
    traverse(queue, st.root);
    return queue.data.iterator();
  }

  private static function traverse <K, V>(
    queue:ArrayDictionary<BinaryTreeNode<K, V>>,
    node: BinaryTreeNode<K, V>): Void {
    if (node == null) {
      return;
    }
    traverse(queue, node.left);
    queue.enqueue(node);
    traverse(queue, node.right);
  }
}
