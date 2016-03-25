package bguiz.struct.ht;

class ListProbeHashTable {
  public static function get <K, V>(
    ht: ListHashTable<K, V>, hasher: K -> Int,
    key: K) : V {
    var hash = (hasher(key) & 0x7fffffff) % ht.capacity;

    // Traverse the chain for this hash (if any) to find the node with the
    // matching key
    var node: ListHashNode<K, V> = ht.entries[hash];
    while (node != null) {
      if (node.key == key) {
        return node.value;
      }
      node = node.next;
    }

    // Did not find node with a matching key
    return null;
  }

  public static function put <K, V>(
    ht: ListHashTable<K, V>, hasher: K -> Int,
    key: K, value: V) : Void {
    if (value == null) {
      delete(ht, hasher, key);
      return;
    }

    var hash = (hasher(key) & 0x7fffffff) % ht.capacity;

    // Traverse chain with matching hash (if any) to find node with matching key
    // If key is found, simply update the value of the node to the new one
    var node: ListHashNode<K, V> = ht.entries[hash];
    while (node != null) {
      if (node.key == key) {
        node.value = value;
        return;
      }
      node = node.next;
    }

    // Key was not found, so insert at the beginning of the chain
    ht.entries[hash] = {
      key: key,
      value: value,
      next: ht.entries[hash], // previous beginning of chain
    };

    return;
  }

  public static function delete <K, V>(
    ht: ListHashTable<K, V>, hasher: K -> Int,
    key: K) : V {
    var hash = (hasher(key) & 0x7fffffff) % ht.capacity;

    // Traverse chain with matching hash (if any) to find node with matching key
    // while keeping track of the previous node as well,
    // so that link may be updated to "skip", thereby deleting, the mathed node
    var node: ListHashNode<K, V> = ht.entries[hash];
    var prevNode: ListHashNode<K, V> = null;
    while (node != null) {
      if (node.key == key) {
        if (prevNode != null) {
          prevNode.next = node.next;
        }
        else {
          // Node was the first in the chain, so update the head of the chain
          ht.entries[hash] = node.next;
        }
        return node.value;
      }
      prevNode = node;
      node = node.next;
    }

    return null;
  }
}
