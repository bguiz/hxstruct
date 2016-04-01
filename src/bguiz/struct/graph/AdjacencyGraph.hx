package bguiz.struct.graph;

@:expose("Struct.AdjacencyGraph")
typedef AdjacencyGraph<T> = {
  var vertices:Array<T>;
  var adjacents:Array<Array<Int>>;
}
