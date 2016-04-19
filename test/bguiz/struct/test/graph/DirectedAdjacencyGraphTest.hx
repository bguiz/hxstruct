package bguiz.struct.test.graph;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.graph.AdjacencyGraph;
using bguiz.struct.graph.DirectedAdjacencyGraph;
using bguiz.struct.graph.DepthFirstSearchGraph;
using bguiz.struct.graph.BreadthFirstSearchGraph;
import bguiz.struct.graph.SearchGraphResult;

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

  @Test
  public function testReverse() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    graph.addEdge(1, 5);
    var reversedGraph:AdjacencyGraph<Int> =
      graph.reverseDirections();
    Assert.areEqual(0, reversedGraph.adjacents[1].length);
    Assert.areEqual(1, reversedGraph.adjacents[5].length);
    Assert.areEqual(1, reversedGraph.adjacents[5][0]);
  }

  @Test
  public function testDepthFirstSearch() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    graph.addEdge(1, 5);
    graph.addEdge(5, 7);
    graph.addEdge(7, 9);
    graph.addEdge(1, 3);
    graph.addEdge(3, 6);

    var result:SearchGraphResult<Int> =
      graph.depthFirstSearch(1);

    Assert.areEqual(1, result.startVertex);
    Assert.areEqual(false, result.marked[0]);
    Assert.areEqual(true, result.marked[1]);
    Assert.areEqual(false, result.marked[2]);
    Assert.areEqual(true, result.marked[3]);
    Assert.areEqual(false, result.marked[4]);
    Assert.areEqual(true, result.marked[5]);
    Assert.areEqual(true, result.marked[6]);
    Assert.areEqual(true, result.marked[7]);
    Assert.areEqual(false, result.marked[8]);
    Assert.areEqual(true, result.marked[9]);

    Assert.areEqual(1, result.edgeTo[5]);
    Assert.areEqual(5, result.edgeTo[7]);
    Assert.areEqual(7, result.edgeTo[9]);
    Assert.areEqual(1, result.edgeTo[3]);
    Assert.areEqual(3, result.edgeTo[6]);
  }

  @Test
  public function testDepthFirstSearchWithJoinBack() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    graph.addEdge(1, 5);
    graph.addEdge(5, 7);
    graph.addEdge(7, 9);
    graph.addEdge(1, 3);
    graph.addEdge(3, 7);

    var result:SearchGraphResult<Int> =
      graph.depthFirstSearch(1);

    Assert.areEqual(1, result.startVertex);
    Assert.areEqual(false, result.marked[0]);
    Assert.areEqual(true, result.marked[1]);
    Assert.areEqual(false, result.marked[2]);
    Assert.areEqual(true, result.marked[3]);
    Assert.areEqual(false, result.marked[4]);
    Assert.areEqual(true, result.marked[5]);
    Assert.areEqual(false, result.marked[6]);
    Assert.areEqual(true, result.marked[7]);
    Assert.areEqual(false, result.marked[8]);
    Assert.areEqual(true, result.marked[9]);

    Assert.areEqual(1, result.edgeTo[5]);
    // 5 was marked previously and takes precedence
    Assert.areNotEqual(5, result.edgeTo[7]);
    Assert.areEqual(7, result.edgeTo[9]);
    Assert.areEqual(1, result.edgeTo[3]);
    Assert.areEqual(3, result.edgeTo[7]);
  }

  @Test
  public function testBreadthFirstSearch() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    graph.addEdge(1, 5);
    graph.addEdge(5, 7);
    graph.addEdge(7, 9);
    graph.addEdge(1, 3);
    graph.addEdge(3, 6);

    var result:SearchGraphResult<Int> =
      graph.breadthFirstSearch(1);

    Assert.areEqual(1, result.startVertex);
    Assert.areEqual(false, result.marked[0]);
    Assert.areEqual(true, result.marked[1]);
    Assert.areEqual(false, result.marked[2]);
    Assert.areEqual(true, result.marked[3]);
    Assert.areEqual(false, result.marked[4]);
    Assert.areEqual(true, result.marked[5]);
    Assert.areEqual(true, result.marked[6]);
    Assert.areEqual(true, result.marked[7]);
    Assert.areEqual(false, result.marked[8]);
    Assert.areEqual(true, result.marked[9]);

    Assert.areEqual(1, result.edgeTo[5]);
    Assert.areEqual(5, result.edgeTo[7]);
    Assert.areEqual(7, result.edgeTo[9]);
    Assert.areEqual(1, result.edgeTo[3]);
    Assert.areEqual(3, result.edgeTo[6]);
  }

  @Test
  public function testBreadthFirstSearchWithJoinBack() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...10) i]);
    graph.addEdge(1, 5);
    graph.addEdge(5, 7);
    graph.addEdge(7, 9);
    graph.addEdge(1, 3);
    graph.addEdge(3, 7);

    var result:SearchGraphResult<Int> =
      graph.breadthFirstSearch(1);

    Assert.areEqual(1, result.startVertex);
    Assert.areEqual(false, result.marked[0]);
    Assert.areEqual(true, result.marked[1]);
    Assert.areEqual(false, result.marked[2]);
    Assert.areEqual(true, result.marked[3]);
    Assert.areEqual(false, result.marked[4]);
    Assert.areEqual(true, result.marked[5]);
    Assert.areEqual(false, result.marked[6]);
    Assert.areEqual(true, result.marked[7]);
    Assert.areEqual(false, result.marked[8]);
    Assert.areEqual(true, result.marked[9]);

    Assert.areEqual(1, result.edgeTo[5]);
    // 5 was marked previously and takes precedence
    Assert.areNotEqual(5, result.edgeTo[7]);
    Assert.areEqual(7, result.edgeTo[9]);
    Assert.areEqual(1, result.edgeTo[3]);
    Assert.areEqual(3, result.edgeTo[7]);
  }

}
