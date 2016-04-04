package bguiz.struct.graph;

typedef DepthFirstSearchGraphResult<T> = {
  var startVertex:Int;
  var edgeTo:Array<Int>;
  var marked:Array<Bool>;
}
