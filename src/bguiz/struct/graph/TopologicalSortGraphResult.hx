package bguiz.struct.graph;

typedef TopologicalSortGraphResult<T> = {
  var marked:Array<Bool>;
  var reversePostOrderVertices:Array<Int>;
}
