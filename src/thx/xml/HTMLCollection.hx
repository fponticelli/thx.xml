package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Element;
import thx.xml.dom.HTMLCollection;

typedef HTMLCollection = thx.xml.dom.HTMLCollection;

class HTMLCollectionImp implements thx.xml.dom.HTMLCollection.HTMLCollectionImp {
  public function namedItem(name : DOMString) : Null<Element> {
    for(item in items)
      if(item.getAttribute("id") == name ||
        (item.namespaceURI == Namespaces.html &&
        item.getAttribute("name") == name))
        return item;
    return null;
  }
  public function item(index : Int) : Null<Element>
    return items[index];
  public var length(default, null) : Int;

  var items : Array<Element>;
  function new() {
    items = [];
    // TODO feed here
    length = items.length;
  }
}
