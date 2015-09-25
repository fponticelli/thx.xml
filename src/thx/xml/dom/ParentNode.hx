package thx.xml.dom;

interface ParentNode {
  var children(default, null) : HTMLCollection;
  var firstElementChild(default, null) : Null<Element>;
  var lastElementChild(default, null) : Null<Element>;
  var childElementCount(default, null) : Int;

  function querySelector(selectors : DOMString) : Null<Element>;
  function querySelectorAll(selectors : DOMString) : NodeList;
}
