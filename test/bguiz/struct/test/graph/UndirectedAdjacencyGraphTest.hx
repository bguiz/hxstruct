package bguiz.struct.test.graph;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.graph.AdjacencyGraph;
using bguiz.struct.graph.UndirectedAdjacencyGraph;

import bguiz.struct.graph.ConnectedSearchGraphResult;
using bguiz.struct.graph.ConnectedComponentsSearchGraph;

class UndirectedAdjacencyGraphTest {
  @Test
  public function testMake() {
    var graph:AdjacencyGraph<Int> =
      UndirectedAdjacencyGraph.make([for (i in 0...10) i]);
    Assert.areEqual(10, graph.vertices.length);
    Assert.areEqual(10, graph.adjacents.length);
  }

  @Test
  public function testAddEdge() {
    var graph:AdjacencyGraph<Int> =
      UndirectedAdjacencyGraph.make([for (i in 0...10) i]);
    Assert.areEqual(0, graph.adjacents[1].length);
    Assert.areEqual(0, graph.adjacents[5].length);
    graph.addEdge(1, 5);
    Assert.areEqual(1, graph.adjacents[1].length);
    Assert.areEqual(1, graph.adjacents[5].length);
    Assert.areEqual(5, graph.adjacents[1][0]);
    Assert.areEqual(1, graph.adjacents[5][0]);
  }
    @Test
    public function testConnectedComponentsSearch() {
      var graph:AdjacencyGraph<Int> =
        UndirectedAdjacencyGraph.make([for (i in 0...10) i]);

      // 1, 3, 5, 6, 7, 9 in one connected component
      graph.addEdge(1, 5);
      graph.addEdge(5, 7);
      graph.addEdge(7, 9);
      graph.addEdge(1, 3);
      graph.addEdge(3, 6);

      // 0, 2, 4 in another connected component
      graph.addEdge(2, 4);
      graph.addEdge(2, 0);

      // 8 in a solo component (not connected to any other vertices)

      var result:ConnectedSearchGraphResult<Int> =
        graph.connectedComponentsSearch();

      Assert.areEqual(0, result.startVertex);
      Assert.areEqual(true, result.marked[0]);
      Assert.areEqual(true, result.marked[1]);
      Assert.areEqual(true, result.marked[2]);
      Assert.areEqual(true, result.marked[3]);
      Assert.areEqual(true, result.marked[4]);
      Assert.areEqual(true, result.marked[5]);
      Assert.areEqual(true, result.marked[6]);
      Assert.areEqual(true, result.marked[7]);
      Assert.areEqual(true, result.marked[8]);
      Assert.areEqual(true, result.marked[9]);

      // 3 distinct groups on connected components should occur
      var grpA:Int = result.connected[1];
      Assert.isNotNull(grpA);
      Assert.areEqual(grpA, result.connected[1]);
      Assert.areEqual(grpA, result.connected[5]);
      Assert.areEqual(grpA, result.connected[7]);
      Assert.areEqual(grpA, result.connected[9]);
      Assert.areEqual(grpA, result.connected[3]);
      Assert.areEqual(grpA, result.connected[6]);

      var grpB:Int = result.connected[0];
      Assert.isNotNull(grpB);
      Assert.areEqual(0, result.connected[0]);
      Assert.areEqual(0, result.connected[2]);
      Assert.areEqual(0, result.connected[4]);

      var grpC:Int = result.connected[8];
      Assert.isNotNull(grpC);
      Assert.areEqual(grpC, result.connected[8]);

      // ensure that the groups aren't the same,
      // after going through all that effort!
      Assert.areNotEqual(grpA, grpB);
      Assert.areNotEqual(grpB, grpC);
      Assert.areNotEqual(grpC, grpA);

      Assert.areEqual(3, result.groupCount);
    }
}
