package thx.xml;

class NodeListImp {
  public function item(index : Int) : Null<Node>
    return items[index];
  public var length(default, null) : Int;

  var items : Array<Node>;
  public function new() {
    items = [];
    length = 0;
  }

  public function insertBefore(node : Node, ?ref : Node) {
    if(null == ref) {
      items.push(node);
    } else {
      var pos = items.indexOf(ref);
      if(pos < 0) pos = length;
      items.insert(pos, node);
    }

    length++;
  }

  public function removeChild(node : Node) {
    if(items.remove(node))
      length--;
  }

  public function indexOf(node : Node)
    return items.indexOf(node);

  public function iterator()
    return items.iterator();
}

@:forward(length)
abstract NodeList(NodeListImp) from NodeListImp to NodeListImp {
  @:arrayAccess
  inline public function item(index : Int) : Null<Node>
    return this.item(index);
}
