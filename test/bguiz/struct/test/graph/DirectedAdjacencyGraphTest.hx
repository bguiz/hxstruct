package bguiz.struct.test.graph;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.graph.AdjacencyGraph;
using bguiz.struct.graph.DirectedAdjacencyGraph;

class DirectedAdjacencyGraphTest {
  @Test
  public function testMake() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    Assert.areEqual(10, graph.vertices.length);
    Assert.areEqual(10, graph.adjacents.length);
  }

  @Test
  public function testAddEdge() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    Assert.areEqual(0, graph.adjacents[1].length);
    Assert.areEqual(0, graph.adjacents[5].length);
    graph.addEdge(1, 5);
    Assert.areEqual(1, graph.adjacents[1].length);
    Assert.areEqual(0, graph.adjacents[5].length);
    Assert.areEqual(5, graph.adjacents[1][0]);
  }
}
