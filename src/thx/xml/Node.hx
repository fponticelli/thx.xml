package thx.xml;

import thx.xml.dom.Document;
import thx.xml.dom.DOMString;
import thx.xml.dom.Element;
import thx.xml.dom.NodeList;
import thx.xml.dom.Node.NodeType;
import thx.xml.dom.Node.DocumentPosition;
import thx.xml.dom.Node as DOMNode;

class Node extends EventTarget implements DOMNode {
  public var nodeType(default, null) : NodeType;
  public var nodeName(default, null) : DOMString;

  public var baseURI(default, null) : Null<DOMString>;

  public var ownerDocument(default, null) : Null<Document>;
  public var parentNode(default, null) : Null<DOMNode>;
  public var parentElement(default, null) : Null<Element>;
  public function hasChildNodes() : Bool {
    return throw "not implemented";
  }
  public var childNodes(default, null) : NodeList;
  public var firstChild(default, null) : Null<DOMNode>;
  public var lastChild(default, null) : Null<DOMNode>;
  public var previousSibling(default, null) : Null<DOMNode>;
  public var nextSibling(default, null) : Null<DOMNode>;

  public var nodeValue : Null<DOMString>;
  public var textContent : Null<DOMString>;
  public function normalize() : Void {
    return throw "not implemented";
  }

  public function cloneNode(?deep : Bool = false) : DOMNode {
    return throw "not implemented";
  }
  public function isEqualNode(?other : DOMNode) : Bool {
    return throw "not implemented";
  }

  public function compareDocumentPosition(other : DOMNode) : DocumentPosition {
    return throw "not implemented";
  }
  public function contains(?other : DOMNode) : Bool {
    return throw "not implemented";
  }

  public function lookupPrefix(namespace : Null<DOMString>) : Null<DOMString> {
    return throw "not implemented";
  }
  public function lookupNamespaceURI(prefix : Null<DOMString>) : Null<DOMString> {
    return throw "not implemented";
  }
  public function isDefaultNamespace(namespace : Null<DOMString>) : Bool {
    return throw "not implemented";
  }

  public function insertBefore(node : DOMNode, ?child : Null<DOMNode>) : DOMNode {
    return throw "not implemented";
  }
  public function appendChild(node : DOMNode) : DOMNode {
    return throw "not implemented";
  }
  public function replaceChild(node : DOMNode, child : DOMNode) : DOMNode {
    return throw "not implemented";
  }
  public function removeChild(child : DOMNode) : DOMNode {
    return throw "not implemented";
  }

  function new(nodeType : NodeType, nodeName : DOMString, baseURI : DOMString, ownerDocument : Document) {
    this.nodeType = nodeType;
    this.nodeName = nodeName;
    this.baseURI = baseURI;
    this.ownerDocument = ownerDocument;
    super();
  }
}
