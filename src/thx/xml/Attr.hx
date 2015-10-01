package thx.xml;

import thx.xml.dom.DOMString;

class Attr {
  public var localName(default, null) : DOMString;
  public var value : DOMString;
  public var name(default, null) : DOMString;
  public var namespaceURI(default, null) : Null<DOMString>;
  public var prefix(default, null) : Null<DOMString>;
  public var specified(default, null) : Bool; // useless; always returns true

  function new(localName : DOMString, value : DOMString, name : DOMString, namespaceURI : DOMString, prefix : DOMString) {
    this.localName = localName;
    this.value = value;
    this.name = name;
    this.namespaceURI = namespaceURI;
    this.prefix = prefix;
    this.specified = true;
  }

  public function equals(that : Attr) {
    return localName == that.localName &&
      value == that.value &&
      name == that.name &&
      namespaceURI == that.namespaceURI &&
      prefix == that.prefix;
  }
}
