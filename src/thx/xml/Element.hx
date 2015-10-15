package thx.xml;

import thx.ReadonlyArray;
import thx.xml.Node.NodeType;
using thx.Nulls;

class Element
    extends Node
    implements ParentNode
    implements NonDocumentTypeChildNode
    implements ChildNode {
  public var namespaceURI(default, null) : Null<DOMString>;
  public var prefix(default, null) : Null<DOMString>;
  public var localName(default, null) : DOMString;
  public var tagName(default, null) : DOMString;

  public var id : DOMString;
  public var className(get, set) : DOMString;
  // [SameObject]
  public var classList(default, null) : DOMTokenList;

  // [SameObject]
  // TODO attributes, cannot really use Array here or it can be modified without using setAttribute
  public var attributes(default, null) : ReadonlyArray<Attr>;
  var _attributes(default, null) : Array<Attr>;
  public function getAttribute(name : DOMString) : Null<DOMString> {
    var attr = getAttributeObj(name);
    if(null != attr)
      return attr.value;
    else
      return null;
  }

  public function getAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Null<DOMString> {
    var attr = getAttributeObjNS(namespace, localName);
    if(null != attr)
      return attr.value;
    else
      return null;
  }

  @:access(thx.xml.Attr.new)
  public function setAttribute(name : DOMString, value : DOMString) : Void {
    // TODO If name does not match the Name production in XML, throw an "InvalidCharacterError" exception.
    var attr = getAttributeObj(name);
    if(null == attr) {
      attr = new Attr(name, value, name, null, null);
      _attributes.push(attr);
    } else {
      attr.value = value;
    }
  }

  // TODO setAttributeNS
  @:access(thx.xml.Attr.new)
  public function setAttributeNS(namespace : Null<DOMString>, name : DOMString, value : DOMString) : Void {
    if("" == namespace)
      namespace = null;
    // If name contains a ":" (U+003E), then split the string on it and let prefix be the part before and localName the part after. Otherwise, let prefix be null and localName be name.
    // If prefix is not null and namespace is null, throw a "NamespaceError" exception.
    // If prefix is "xml" and namespace is not the XML namespace, throw a "NamespaceError" exception.
    // If name or prefix is "xmlns" and namespace is not the XMLNS namespace, throw a "NamespaceError" exception.
    // If namespace is the XMLNS namespace and neither name nor prefix is "xmlns", throw a "NamespaceError" exception.
    // Set an attribute for the context object using localName, value, and also name, prefix, and namespace.
  }

  public function removeAttribute(name : DOMString) : Void {
    var attr = getAttributeObj(name);
    if(null != attr)
      _attributes.remove(attr);
  }

  // TODO removeAttributeNS
  public function removeAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Void {
    return throw new thx.error.NotImplemented();
  }

  public function hasAttribute(name : DOMString) : Bool
    return getAttributeObj(name) != null;

  public function hasAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Bool
    return getAttributeObjNS(namespace, localName) != null;

  // TODO getElementsByTagName
  public function getElementsByTagName(localName : DOMString) : HTMLCollection {
    return throw new thx.error.NotImplemented();
  }
  // TODO getElementsByTagNameNS
  public function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : HTMLCollection {
    return throw new thx.error.NotImplemented();
  }
  // TODO getElementsByClassName
  public function getElementsByClassName(classNames : DOMString) : HTMLCollection {
    return throw new thx.error.NotImplemented();
  }

  function new(localName : DOMString, prefix : Null<DOMString>, namespaceURI : Null<DOMString>,  ownerDocument : Document) {
    this.attributes = this._attributes = [];
    var tagName;
    if(prefix == null) {
      tagName = localName;
    } else {
      tagName = '$prefix:$localName';
    }
    this.localName = localName;
    this.prefix = prefix;
    this.namespaceURI = namespaceURI;
    super(ELEMENT_NODE, tagName, ownerDocument);
  }

  public function remove() : Void {
    // TODO remove
    return throw new thx.error.NotImplemented();
  }
  public var nextElementSibling : Null<Element>;
  public var previousElementSibling : Null<Element>;

  public var children(default, null) : HTMLCollection;
  public var firstElementChild(default, null) : Null<Element>;
  public var lastElementChild(default, null) : Null<Element>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<Element> {
    // TODO querySelector
    return throw new thx.error.NotImplemented();
  }
  public function querySelectorAll(selectors : DOMString) : NodeList {
    // TODO querySelectorAll
    return throw new thx.error.NotImplemented();
  }

  function getAttributeObj(name : DOMString) : Attr {
    // TODO If the context object is in the HTML namespace and its node document is an HTML document, let name be converted to ASCII lowercase.
    for(attr in attributes)
      if(attr.name == name)
        return attr;
    return null;
  }

  function getAttributeObjNS(namespace : Null<DOMString>, localName : DOMString) : Attr {
    // TODO If the context object is in the HTML namespace and its node document is an HTML document, let name be converted to ASCII lowercase.
    // TODO If name does not match the QName production in Namespaces in XML, throw a "NamespaceError" exception.

    // If name contains a ":" (U+003E), then split the string on it and let prefix be the part before and localName the part after. Otherwise, let prefix be null and localName be name.
    for(attr in attributes)
      if(attr.namespaceURI == namespace && attr.localName == localName)
        return attr;
    return null;
  }

  function locateNamespacePrefix(namespace : DOMString) : Null<DOMString> {
    if(namespaceURI == namespace && prefix != null)
      return prefix;
    // TODO locateNamespacePrefix, step 2 requires getAttributeObject(): https://dom.spec.whatwg.org/#locate-a-namespace-prefix
    var pel = Std.instance(parentElement, Element);
    if(null == pel)
      return null;
    else
      return pel.locateNamespacePrefix(namespace);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherElement : Element = cast other;
    if(namespaceURI != otherElement.namespaceURI || prefix != otherElement.prefix || localName != otherElement.localName || attributes.length != otherElement.attributes.length)
      return false;
    // TODO isEqualNode, check attributes equality
    if(childNodes.length != otherElement.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherElement.childNodes[i]))
        return false;
    return true;
  }

  function get_className()
    return getAttribute("class").or("");

  function set_className(value : String) {
    setAttribute("class", value);
    return value;
  }
}
