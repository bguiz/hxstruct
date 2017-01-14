package bguiz.struct.graph;

typedef SearchGraphResult<T> = {
  var startVertex:Int;
  var edgeTo:Array<Null<Int>>;
  var marked:Array<Bool>;
}
