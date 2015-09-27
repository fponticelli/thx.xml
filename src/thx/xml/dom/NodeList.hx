package thx.xml.dom;

@:forward(length)
abstract NodeList(NodeListImp) from NodeListImp to NodeListImp {
  @:arrayAccess
  inline public function item(index : Int) : Null<Node>
    return this.item(index);
}

interface NodeListImp {
  function item(index : Int) : Null<Node>;
  var length(default, null) : Int;
}
