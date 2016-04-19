package bguiz.struct.graph;

typedef ConnectedSearchGraphResult<T> = {
  > SearchGraphResult<T>,
  var connected:Array<Int>;
  var groupCount:Int;
}
