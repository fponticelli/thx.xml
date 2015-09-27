package thx.xml;

import thx.xml.dom.NodeList;

typedef NodeList = thx.xml.dom.NodeList;

class NodeListImp implements thx.xml.dom.NodeList.NodeListImp {
  public function item(index : Int) : Null<Node>
    return items[index];
  public var length(default, null) : Int;

  var items : Array<Node>;
  function new() {
    items = [];
    // TODO feed here
    length = items.length;
  }
}
