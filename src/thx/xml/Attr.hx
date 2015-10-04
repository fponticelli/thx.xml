package thx.xml;

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

  // NON-STANDARD
  public function toString() : String
    return value;

  static public function equals(self : Attr, that : Attr) {
    return self.localName == that.localName &&
      self.value == that.value &&
      self.name == that.name &&
      self.namespaceURI == that.namespaceURI &&
      self.prefix == that.prefix;
  }
}
