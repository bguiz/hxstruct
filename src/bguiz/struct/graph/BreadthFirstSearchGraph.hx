package bguiz.struct.graph;

import bguiz.struct.dict.ArrayDictionary;
using bguiz.struct.dict.ArrayQueue;

class BreadthFirstSearchGraph {
  public static function breadthFirstSearch<T> (
    graph: AdjacencyGraph<T>,
    startVertex:Int): SearchGraphResult<T> {
    var result = {
      startVertex: startVertex,
      edgeTo: [for (i in 0...graph.vertices.length) null],
      marked: [for (i in 0...graph.vertices.length) false],
    };
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
    return result;
  }
}
