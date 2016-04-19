package bguiz.struct.graph;

import bguiz.struct.graph.AdjacencyGraph;

@:expose("Struct.DirectedAdjacencyGraph")
class DirectedAdjacencyGraph {
  public static function make<T> (
    vertices: Array<T>): AdjacencyGraph<T> {
    var graph:AdjacencyGraph<T> = {
      vertices: vertices,
      adjacents: [for (i in 0...vertices.length) []],
    };
    return graph;
  }

  public static function addEdge<T> (
    graph: AdjacencyGraph<T>,
    fromVertex: Int, toVertex: Int): Void {
      graph.adjacents[fromVertex].push(toVertex);
  }

  public static function reverseDirections<T> (
    graph: AdjacencyGraph<T>
  ): AdjacencyGraph<T> {
    var reversedGraph:AdjacencyGraph<T> = {
      vertices: [for (vertex in graph.vertices) vertex],
      adjacents: [for (i in 0...graph.vertices.length) []],
    };
    for (fromVertex in 0...graph.vertices.length) {
      for (toVertex in graph.adjacents[fromVertex]) {
        reversedGraph.adjacents[toVertex].push(fromVertex);
      }
    }
    return reversedGraph;
  }
}
