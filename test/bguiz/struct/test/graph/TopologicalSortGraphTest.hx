package bguiz.struct.test.graph;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import bguiz.struct.graph.AdjacencyGraph;
using bguiz.struct.graph.DirectedAdjacencyGraph;

import bguiz.struct.graph.TopologicalSortGraphResult;
using bguiz.struct.graph.TopologicalSortGraph;

class TopologicalSortGraphTest {

  public static function assertArrayEqual <T>(a: Array<T>, b: Array<T>): Void {
    Assert.areEqual(a.toString(), b.toString());
    Assert.areEqual(a.length, b.length);
    var i:Int = 0;
    while (i < a.length) {
      Assert.areEqual(a[i], b[i]);
      ++i;
    }
  }

  @Test
  public function testConnectedComponentsSearch1() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...4) i]);

    graph.addEdge(0, 1);
    graph.addEdge(1, 2);
    graph.addEdge(2, 3);

    var result:TopologicalSortGraphResult<Int> =
      graph.topologicalSort();

    assertArrayEqual([3,2,1,0], result.reversePostOrderVertices);
  }

  @Test
  public function testConnectedComponentsSearch2() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...4) i]);

    graph.addEdge(0, 1);
    graph.addEdge(0, 3);
    graph.addEdge(1, 3);
    graph.addEdge(2, 3);
    graph.addEdge(2, 0);

    var result:TopologicalSortGraphResult<Int> =
      graph.topologicalSort();

    assertArrayEqual([3,1,0,2], result.reversePostOrderVertices);
  }

  @Test
  public function testConnectedComponentsSearch3() {
    var graph:AdjacencyGraph<Int> =
      DirectedAdjacencyGraph.make([for (i in 0...7) i]);

    graph.addEdge(0, 1);
    graph.addEdge(0, 2);

    graph.addEdge(1, 3);

    graph.addEdge(2, 3);
    graph.addEdge(2, 4);

    graph.addEdge(3, 5);
    graph.addEdge(3, 6);

    graph.addEdge(4, 5);

    var result:TopologicalSortGraphResult<Int> =
      graph.topologicalSort();

    assertArrayEqual([5,6,3,1,4,2,0], result.reversePostOrderVertices);
  }
}
