package bguiz.struct.test.ht;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import bguiz.struct.ht.LinearHashTable;
import bguiz.struct.ht.HashNode;
using bguiz.struct.ht.LinearProbeHashTable;

class LinearProbeHashTableTest {
  var ht:LinearHashTable<Int, String>;

  static function intHasher(a: Int): Int {
    return a;
  }

  public function new() {}

  @Before
  public function setup() {
    ht = {
      capacity: 7,
      // size of vector is more than capacity on purpose,
      // to explicitly test that the specified capacity is used
      // insted of inferring from vector size
      entries: new haxe.ds.Vector<HashNode<Int, String>>(10),
    };
  }

  @Test
  public function testGetWhenEmpty() {
    var value:String;
    value = ht.get(intHasher, 1);
    Assert.isNull(value);
  }

  @Test
  public function testGetWithSingleEntry() {
    ht.entries[1] = {
      key: 1,
      value: "eins",
    };
    var value:String = ht.get(intHasher, 1);
    Assert.areEqual("eins", value);
  }

  @Test
  public function testGetWhenEmptyWithModulo() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    var value:String = ht.get(intHasher, 29);
    Assert.areEqual("neunundzwanzig", value);
  }

  @Test
  public function testGetWithCollision() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    ht.entries[2] = {
      key: 8,
      value: "acht",
    };
    var value:String = ht.get(intHasher, 8);
    Assert.areEqual("acht", value);
  }

  @Test
  public function testGetWithCollisionButNoHit() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    ht.entries[2] = {
      key: 8,
      value: "acht",
    };
    var value:String = ht.get(intHasher, 1);
    Assert.isNull(value);
  }

  @Test
  public function testPutWhenEmpty() {
    var value:String;
    ht.put(intHasher, 1, "eins");
    Assert.areEqual("eins", ht.entries[1].value);
  }

  @Test
  public function testPutWhenEmptyWithModulo() {
    ht.put(intHasher, 8, "acht");
    Assert.areEqual("acht", ht.entries[1].value);
  }

  @Test
  public function testPutWithUpdate() {
    ht.put(intHasher, 14, "vierzehn");
    ht.put(intHasher, 14, "fourteen");
    Assert.areEqual("fourteen", ht.entries[0].value);
  }

  @Test
  public function testPutWithCollision() {
    ht.put(intHasher, 2, "zwei");
    ht.put(intHasher, 9, "neun");
    Assert.areEqual("zwei", ht.entries[2].value);
    Assert.areEqual("neun", ht.entries[3].value);
  }

  @Test
  public function testPutWithUpdateAndCollision() {
    ht.put(intHasher, 14, "vierzehn");
    ht.put(intHasher, 7, "seben");
    ht.put(intHasher, 0, "null");
    ht.put(intHasher, 21, "einundzwanzig");
    ht.put(intHasher, 7, "seven");
    Assert.areEqual("seven", ht.entries[1].value);
    Assert.areEqual("vierzehn", ht.entries[0].value);
    Assert.areEqual("null", ht.entries[2].value);
  }

  @Test
  public function testDeleteWhenEmpty() {
    var value:String = ht.delete(intHasher, 1);
    Assert.isNull(value);
  }

  @Test
  public function testDeleteWithSingleElement() {
    ht.entries[1] = {
      key: 8,
      value: "acht",
    };
    var value:String;

    value = ht.delete(intHasher, 1);
    Assert.isNull(value);
    Assert.isNotNull(ht.entries[1]);

    value = ht.delete(intHasher, 8);
    Assert.areEqual("acht", value);
    Assert.isNull(ht.entries[1]);
  }

  @Test
  public function testDeleteAtEndOfSequence() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    ht.entries[2] = {
      key: 8,
      value: "acht",
    };
    ht.entries[3] = {
      key: 1,
      value: "eins",
    };

    var value:String;
    value = ht.delete(intHasher, 1);
    Assert.areEqual("eins", value);

    Assert.isNotNull(ht.entries[1]);
    Assert.areEqual(ht.entries[1].value, "neunundzwanzig");
    Assert.isNotNull(ht.entries[2]);
    Assert.areEqual(ht.entries[2].value, "acht");
    Assert.isNull(ht.entries[3]);
  }

  @Test
  public function testDeleteAtMiddleOfSequence() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    ht.entries[2] = {
      key: 8,
      value: "acht",
    };
    ht.entries[3] = {
      key: 1,
      value: "eins",
    };

    var value:String;
    value = ht.delete(intHasher, 8);
    Assert.areEqual("acht", value);

    Assert.isNotNull(ht.entries[1]);
    Assert.areEqual(ht.entries[1].value, "neunundzwanzig");
    Assert.isNotNull(ht.entries[2]);
    Assert.areEqual(ht.entries[2].value, "eins");
    Assert.isNull(ht.entries[3]);
  }

  @Test
  public function testDeleteAtStartOfSequence() {
    ht.entries[1] = {
      key: 29,
      value: "neunundzwanzig",
    };
    ht.entries[2] = {
      key: 8,
      value: "acht",
    };
    ht.entries[3] = {
      key: 1,
      value: "eins",
    };

    var value:String;
    value = ht.delete(intHasher, 29);
    Assert.areEqual("neunundzwanzig", value);

    Assert.isNotNull(ht.entries[1]);
    Assert.areEqual(ht.entries[1].value, "eins");
    Assert.isNotNull(ht.entries[2]);
    Assert.areEqual(ht.entries[2].value, "acht");
    Assert.isNull(ht.entries[3]);
  }
}
