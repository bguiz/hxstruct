package bguiz.struct.graph;

typedef ConnectedSearchGraphResult<T> = {
  > SearchGraphResult<T>,
  var connected:Array<Null<Int>>;
  var groupCount:Int;
}
