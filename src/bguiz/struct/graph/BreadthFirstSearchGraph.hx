package bguiz.struct.graph;

import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayQueue;

@:expose("Struct.BreadthFirstSearchGraph")
class BreadthFirstSearchGraph {
  public static function breadthFirstSearch<T> (
    graph: AdjacencyGraph<T>,
    startVertex:Int): SearchGraphResult<T> {
    var result = {
      startVertex: startVertex,
      edgeTo: [for (i in 0...graph.vertices.length) null],
      marked: [for (i in 0...graph.vertices.length) false],
    };
    breadthFirstSearchPart(graph, startVertex, result);
    return result;
  }

  public static function breadthFirstSearchPart<T> (
    graph: AdjacencyGraph<T>,
    startVertex:Int, result:SearchGraphResult<T>
  ): Void {
    var queue:ArrayDictionary<Int> = {
      data: [startVertex],
    };
    while (!queue.isEmpty()) {
      var fromVertex:Int = queue.dequeue();
      result.marked[fromVertex] = true;
      for (toVertex in graph.adjacents[fromVertex]) {
        if (!result.marked[toVertex]) {
          queue.enqueue(toVertex);
          result.edgeTo[toVertex] = fromVertex;
        }
      }
    }
  }
}
