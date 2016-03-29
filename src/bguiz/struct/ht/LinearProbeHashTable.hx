package bguiz.struct.ht;

@:expose("Struct.LinearHashTable")
class LinearProbeHashTable {
  public static function get <K, V>(
    ht: LinearHashTable<K, V>, hasher: K -> Int,
    key: K) : V {
    var hash:Int = (hasher(key) & 0x7fffffff) % ht.capacity;
    var originalHash:Int = hash;

    // Traverse the array beginning at this hash (if any)
    // to find the node with the matching key
    var node: HashNode<K, V> = ht.entries[hash];
    while (node != null) {
      if (node.key == key) {
        return node.value;
      }
      hash = (hash+1) % ht.capacity;
      if (hash == originalHash) {
        // This hash table is full, cannot find any more
        return null;
        // TODO implement resizing logic here
      }
      node = ht.entries[hash];
    }

    // Did not find node with a matching key
    return null;
  }

  public static function put <K, V>(
    ht: LinearHashTable<K, V>, hasher: K -> Int,
    key: K, value: V) : Void {
    if (value == null) {
      delete(ht, hasher, key);
      return;
    }

    var hash:Int = (hasher(key) & 0x7fffffff) % ht.capacity;
    var originalHash = hash;

    // Traverse array beginning with matching hash (if any) to find node with matching key
    // If key is found, simply update the value of the node to the new one
    var node: HashNode<K, V> = ht.entries[hash];
    while (node != null) {
      if (node.key == key) {
        node.value = value;
        return;
      }
      hash = (hash+1) % ht.capacity;
      if (hash == originalHash) {
        // This hash table is full, cannot insert any more
        return;
        // TODO implement resizing logic here
      }
      node = ht.entries[hash];
    }

    // Key was not found, so insert at the hash that was last probed and found to be empty
    ht.entries[hash] = {
      key: key,
      value: value,
    };

    return;
  }

  public static function delete <K, V>(
    ht: LinearHashTable<K, V>, hasher: K -> Int,
    key: K) : V {
    var hash:Int = (hasher(key) & 0x7fffffff) % ht.capacity;
    var originalHash:Int = hash;
    var foundAtHash:Int = -1;

    // Traverse chain with matching hash (if any) to find node with matching key
    // while keeping track of the previous node as well,
    // so that link may be updated to "skip", thereby deleting, the matched node
    var node: HashNode<K, V> = ht.entries[hash];
    var returnValue:V = null;
    while (node != null) {
      if (node.key == key) {
        returnValue = node.value;
        // ht.entries[hash] = null;
        foundAtHash = hash;
      }
      var nextHash:Int = (hash+1) % ht.capacity;
      if (foundAtHash >= 0 && ht.entries[nextHash] == null) {
        ht.entries[foundAtHash] = ht.entries[hash];
        ht.entries[hash] = null;
      }
      hash = nextHash;
      if (hash == originalHash) {
        // This hash table is full
        return returnValue;
        // TODO implement resizing logic here
      }
      node = ht.entries[hash];
    }

    return returnValue;
  }
}
