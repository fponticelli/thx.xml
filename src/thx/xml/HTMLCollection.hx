package thx.xml;

class HTMLCollectionImp {
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
    // TODO new HTMLCollectionImp, feed here
    length = items.length;
  }
}

@:forward(length)
abstract HTMLCollection(HTMLCollectionImp) from HTMLCollectionImp to HTMLCollectionImp {
  @:arrayAccess
  inline public function namedItem(name : DOMString) : Null<Element>
    return this.namedItem(name);
  @:arrayAccess
  inline public function item(index : Int) : Null<Element>
    return this.item(index);
}
