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
  public function hasChildNodes() : Bool
    return null != firstChild;
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

  static function getRoot(node : DOMNode) : DOMNode {
    while(null != node.parentNode)
      node = node.parentNode;
    return node;
  }

  static function isAncestor(subject : DOMNode, node : DOMNode) {
    while(node.parentNode != null) {
      if(node.parentNode == subject)
        return true;
      node = node.parentNode;
    }
    return false;
  }

  static function isHostIncludingInclusiveAncestor(subject : DOMNode, node : DOMNode) {
    return isInclusiveAncestor(subject, node) || true; // TODO needs to implement the
    // second part of https://dom.spec.whatwg.org/#concept-tree-host-including-inclusive-ancestor
  }

  static function isInclusiveAncestor(subject : DOMNode, node : DOMNode)
    return subject == node || isAncestor(subject, node);

  static function isSibling(subject : DOMNode, node : DOMNode) {
    if(subject.parentNode == null || node.parentNode == null)
      return false;
    return subject.parentNode == node.parentNode;
  }

  static function isInclusiveSibling(subject : DOMNode, node : DOMNode)
    return subject == node || isSibling(subject, node);

  static function getNodeAncestors(node : DOMNode) : Array<DOMNode> {
    var arr : Array<DOMNode> = [];
    node = node.parentNode;
    while(null != node) {
      arr.insert(0, node);
      node = node.parentNode;
    }
    return arr;
  }

  // TODO a little disgusting unsafe cast
  override function getAncestors() : Array<EventTarget>
    return cast getNodeAncestors(this);

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
