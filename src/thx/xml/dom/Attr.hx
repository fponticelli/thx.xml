package thx.xml.dom;

interface Attr {
  var localName(default, null) : DOMString;
  var value : DOMString;
  var name(default, null) : DOMString;
  var namespaceURI(default, null) : Null<DOMString>;
  var prefix(default, null) : Null<DOMString>;
  var specified(default, null) : Bool; // useless; always returns true
}
