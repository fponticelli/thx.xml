package thx.xml.dom;

@:forward(length)
abstract HTMLCollection(HTMLCollectionImp) from HTMLCollectionImp to HTMLCollectionImp {
  @:arrayAccess
  inline public function namedItem(name : DOMString) : Null<Element>
    return this.namedItem(name);
  @:arrayAccess
  inline public function item(index : Int) : Null<Element>
    return this.item(index);
}

interface HTMLCollectionImp {
  var length(default, null) : Int;
  function item(index : Int) : Null<Element>;
  function namedItem(name : DOMString) : Null<Element>;
}
