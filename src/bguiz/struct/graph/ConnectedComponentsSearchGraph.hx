package bguiz.struct.graph;

// usingbguiz.struct.graph. DepthFirstSearchGraph;
import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayStack;

class ConnectedComponentsSearchGraph<T> {

  public static function connectedComponentsSearch<T>(
    graph: AdjacencyGraph<T>
  ): ConnectedSearchGraphResult<T> {
    var result:ConnectedSearchGraphResult<T> = {
      startVertex: 0,
      edgeTo: [for (i in 0...graph.vertices.length) null],
      marked: [for (i in 0...graph.vertices.length) false],
      connected: [for (i in 0...graph.vertices.length) null],
      groupCount: 0,
    };

    for (vertex in 0...graph.vertices.length) {
      if (!result.marked[vertex]) {
        // Depth first search begins
        var stack:ArrayDictionary<Int> = {
          data: [vertex],
        };
        while (!stack.isEmpty()) {
          var fromVertex:Int = stack.pop();
          result.marked[fromVertex] = true;
          result.connected[fromVertex] = result.groupCount;
          for (toVertex in graph.adjacents[fromVertex]) {
            if (!result.marked[toVertex]) {
              result.connected[toVertex] = result.groupCount;
              stack.push(toVertex);
              result.edgeTo[toVertex] = fromVertex;
            }
          }
        }

        // After depth first search is complete,
        // any unmarked vertices that remain - if any -
        // are in subsequent connected components
        ++result.groupCount;
      }
    }

    return result;
  }
}
