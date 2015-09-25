package thx.xml.dom;

interface HTMLCollection {
  var length(default, null) : Int;
  function item(index : Int) : Null<Element>;
  function namedItem(name : DOMString) : Null<Element>;
}
