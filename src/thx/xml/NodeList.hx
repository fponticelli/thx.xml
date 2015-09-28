package thx.xml;

import thx.xml.dom.NodeList;
import thx.xml.dom.Node as DOMNode;

typedef NodeList = thx.xml.dom.NodeList;

class NodeListImp implements thx.xml.dom.NodeList.NodeListImp {
  public function item(index : Int) : Null<DOMNode>
    return items[index];
  public var length(default, null) : Int;

  var items : Array<DOMNode>;
  public function new() {
    items = [];
    length = 0;
  }

  public function insertBefore(node : DOMNode, ?ref : DOMNode) {
    if(null == ref) {
      items.push(node);
    } else {
      var pos = items.indexOf(ref);
      if(pos < 0) pos = length;
      items.insert(pos, node);
    }

    length++;
  }

  public function iterator()
    return items.iterator();
}
