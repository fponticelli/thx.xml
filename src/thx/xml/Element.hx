package thx.xml;

import thx.xml.dom.Attr;
import thx.xml.dom.DOMString;
import thx.xml.dom.DOMTokenList;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.Node.NodeType;
import thx.xml.dom.HTMLCollection as DOMHTMLCollection;
import thx.xml.dom.NodeList as DOMNodeList;

class Element extends Node implements DOMElement {
  public var namespaceURI(default, null) : Null<DOMString>;
  public var prefix(default, null) : Null<DOMString>;
  public var localName(default, null) : DOMString;
  public var tagName(default, null) : DOMString;

  public var id : DOMString;
  public var className : DOMString;
  // [SameObject]
  public var classList(default, null) : DOMTokenList;

  // [SameObject]
  // TODO cannot really use Array here or it can be modified without using setAttribute
  public var attributes(default, null) : Array<Attr>;
  public function getAttribute(name : DOMString) : Null<DOMString>
    return getAttributeNS(null, name);
  public function getAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Null<DOMString> {
    for(attr in attributes)
      if(attr.localName == localName && attr.namespaceURI == namespace)
        return attr.value;
    return null;
  }
  public function setAttribute(name : DOMString, value : DOMString) : Void {
    return throw 'not implemented';
  }
  public function setAttributeNS(namespace : Null<DOMString>, name : DOMString, value : DOMString) : Void {
    return throw 'not implemented';
  }
  public function removeAttribute(name : DOMString) : Void {
    return throw 'not implemented';
  }
  public function removeAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Void {
    return throw 'not implemented';
  }
  public function hasAttribute(name : DOMString) : Bool {
    return throw 'not implemented';
  }
  public function hasAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Bool {
    return throw 'not implemented';
  }

  public function getElementsByTagName(localName : DOMString) : DOMHTMLCollection {
    return throw 'not implemented';
  }
  public function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : DOMHTMLCollection {
    return throw 'not implemented';
  }
  public function getElementsByClassName(classNames : DOMString) : DOMHTMLCollection {
    return throw 'not implemented';
  }

  function new(localName : DOMString, prefix : Null<DOMString>, namespaceURI : Null<DOMString>,  baseURI : DOMString, ownerDocument : Document) {
    this.attributes = [];
    var tagName;
    if(prefix == null) {
      tagName = localName;
    } else {
      tagName = '$prefix:$localName';
    }
    this.localName = localName;
    this.prefix = prefix;
    this.namespaceURI = namespaceURI;
    super(ELEMENT_NODE, tagName, baseURI, ownerDocument);
  }

  public function remove() : Void {
    // TODO
    return throw "not implemented";
  }
  public var nextElementSibling : Null<DOMElement>;
  public var previousElementSibling : Null<DOMElement>;

  public var children(default, null) : DOMHTMLCollection;
  public var firstElementChild(default, null) : Null<DOMElement>;
  public var lastElementChild(default, null) : Null<DOMElement>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<DOMElement> {
    // TODO
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : DOMNodeList {
    // TODO
    return throw "not implemented";
  }

  function locateNamespacePrefix(namespace : DOMString) : Null<DOMString> {
    if(namespaceURI == namespace && prefix != null)
      return prefix;
    // TODO step 2 requires getAttributeObject(): https://dom.spec.whatwg.org/#locate-a-namespace-prefix
    var pel = Std.instance(parentElement, Element);
    if(null == pel)
      return null;
    else
      return pel.locateNamespacePrefix(namespace);
  }

  override public function isEqualNode(?other : thx.xml.dom.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherElement : DOMElement = cast other;
    if(namespaceURI != otherElement.namespaceURI || prefix != otherElement.prefix || localName != otherElement.localName || attributes.length != otherElement.attributes.length)
      return false;
    // TODO check attributes equality
    if(childNodes.length != otherElement.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherElement.childNodes[i]))
        return false;
    return true;
  }
}
