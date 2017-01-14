package bguiz.struct.graph;

import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayStack;

@:expose("Struct.DepthFirstSearchGraph")
class DepthFirstSearchGraph {
  public static function depthFirstSearch<T> (
    graph: AdjacencyGraph<T>,
    startVertex: Int
  ): SearchGraphResult<T> {
    var result = {
      startVertex: startVertex,
      edgeTo: [for (i in 0...graph.vertices.length) null],
      marked: [for (i in 0...graph.vertices.length) false],
    };
    depthFirstSearchPart(graph, startVertex, result);
    return result;
  }

  public static function  depthFirstSearchPart<T> (
    graph: AdjacencyGraph<T>,
    startVertex: Int,
    result: SearchGraphResult<T>
  ): Void {
    // recursion in a typical DFS implementation is so simple here
    // that a stack-based implementation is very simple
    var stack:ArrayDictionary<Int> = {
      data: [startVertex],
    };
    while (!stack.isEmpty()) {
      var fromVertex:Int = stack.pop();
      result.marked[fromVertex] = true;
      for (toVertex in graph.adjacents[fromVertex]) {
        if (!result.marked[toVertex]) {
          stack.push(toVertex);
          result.edgeTo[toVertex] = fromVertex;
        }
      }
    }
  }
}
