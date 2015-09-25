package thx.xml.dom;

@:forward(length)
abstract NodeList(NodeListInt) from NodeListInt to NodeListInt {
  @:arrayAccess
  inline public function item(index : Int) : Null<Node>
    return this.item(index);
}

interface NodeListInt {
  function item(index : Int) : Null<Node>;
  var length(default, null) : Int;
}
