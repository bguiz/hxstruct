package bguiz.struct.graph;

import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayStack;

//NOTE *must* be a directed acyclic graph (DAG) i.e. no cycles
@:expose("Struct.TopologicalSortGraph")
class TopologicalSortGraph {

  // Find an order of all the vetrices such that the all of
  // the directed edges point in the same direction
  // Perform a depth first search, and then returnthe vertices in reverse post order
  // Every vertex must be searched, hence no start vertex needs to be specified
  public static function topologicalSort<T> (
    graph: AdjacencyGraph<T>
  ): TopologicalSortGraphResult<T> {
    var result = {
      reversePostOrderVertices: [],
      marked: [for (i in 0...graph.vertices.length) false]
    };
    for (i in 0...graph.vertices.length) {
      if (!result.marked[i]) {
        topologicalSortPart(graph, i, result);
      }
    }
    return result;
  }

  public static function topologicalSortPart<T> (
    graph: AdjacencyGraph<T>,
    fromVertex: Int,
    result: TopologicalSortGraphResult<T>
  ) : Void {
    //TODO find a way to do this iteratively (rather than recursively)
    // however tracking reverse post order of the depth first search
    // proves to be tricky to implement
    result.marked[fromVertex] = true;
    for (toVertex in graph.adjacents[fromVertex]) {
      if (!result.marked[toVertex]) {
        topologicalSortPart(graph, toVertex, result);
      }
    }
    result.reversePostOrderVertices.push(fromVertex);
  }
}
