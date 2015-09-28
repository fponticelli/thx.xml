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
  // requires subclasses to call super.isEqualNode() first
  public function isEqualNode(?other : DOMNode) : Bool {
    return null != other && nodeType == other.nodeType;
  }

  public function compareDocumentPosition(other : DOMNode) : DocumentPosition {
    return throw "not implemented";
  }
  public function contains(?other : DOMNode) : Bool {
    if(null == other)
      return false;
    return isInclusiveDescendant(this, other);
  }

  @:access(thx.xml.Element.locateNamespacePrefix)
  public function lookupPrefix(namespace : Null<DOMString>) : Null<DOMString> {
    if(namespace == null || namespace == "")
      return null;
    // TODO move this to subclass
    return switch nodeType {
      case ELEMENT_NODE:
        var el : thx.xml.Element = cast this;
        el.locateNamespacePrefix(namespace);
      case DOCUMENT_NODE:
        var doc : Document = cast this,
            el : thx.xml.Element = Std.instance(doc.documentElement, thx.xml.Element);
        if(null == el)
          null;
        else
          el.locateNamespacePrefix(namespace);
      case DOCUMENT_TYPE_NODE, DOCUMENT_FRAGMENT_NODE:
        null;
      case _ if(parentElement == null):
        null;
      case _:
        var el : thx.xml.Element = Std.instance(parentElement, thx.xml.Element);
        el.locateNamespacePrefix(namespace);
    };
  }

  public function lookupNamespaceURI(prefix : Null<DOMString>) : Null<DOMString> {
    // TODO move this to subclass
    if("" == prefix) prefix = null;
    return switch nodeType {
      case ELEMENT_NODE:
        var el : Element = cast this;
        if(el.namespaceURI != null && el.prefix == prefix)
          el.namespaceURI;
        // TODO add more cases from step 2: https://dom.spec.whatwg.org/#locate-a-namespace
        if(el.hasAttributeNS(Namespaces.xmlns, prefix))
          el.getAttributeNS(Namespaces.xmlns, prefix);
        if(parentNode == null)
          null;
        parentNode.lookupNamespaceURI(prefix);
      case DOCUMENT_NODE:
        var doc : Document = cast this;
        if(doc.documentElement == null)
          null;
        else
          doc.documentElement.lookupNamespaceURI(prefix);
      case DOCUMENT_TYPE_NODE, DOCUMENT_FRAGMENT_NODE:
        null;
      case _ if(parentNode == null):
        null;
      case _:
        parentNode.lookupNamespaceURI(prefix);
    };
  }

  public function isDefaultNamespace(namespace : Null<DOMString>) : Bool {
    if(null == namespace)
      namespace = "";
    var defaultNamespace = lookupNamespaceURI(null);
    return defaultNamespace == namespace;
  }

  public function insertBefore(node : DOMNode, ?child : Null<DOMNode>) : DOMNode {
    // ensure pre-insertion validity
    ensurePreInsertionValidity(this, node, child);

    // Let reference child be child
    var referenceChild = child;

    // If reference child is node, set it to node’s next sibling
    if(referenceChild == node)
      referenceChild = node.nextSibling;

    // Adopt node into parent’s node document
    adopt(ownerDocument, node);

    // Insert node into parent before reference child
    childNodesImpl.insertBefore(node, child);

    // Return node
    return node;
  }

  static function adopt(doc : Document, node : DOMNode) {
    if(null != node.parentNode)
      node.parentNode.removeChild(node);
    doc.adoptNode(node);
  }

  static function ensurePreInsertionValidity(parent : DOMNode, node : DOMNode, ?child : DOMNode) {
    // TODO move this to subclass
    if(parent.nodeType != DOCUMENT_NODE &&
       parent.nodeType != DOCUMENT_FRAGMENT_NODE &&
       parent.nodeType != ELEMENT_NODE)
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
    if(isHostIncludingInclusiveAncestor(node, parent))
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
    if(null != child && child.parentNode != parent)
      throw DOMException.fromCode(NOT_FOUND_ERR);
    if(node.nodeType != DOCUMENT_FRAGMENT_NODE &&
       node.nodeType != DOCUMENT_TYPE_NODE &&
       node.nodeType != ELEMENT_NODE &&
       node.nodeType != TEXT_NODE &&
       node.nodeType != PROCESSING_INSTRUCTION_NODE &&
       node.nodeType != COMMENT_NODE)
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
    if((node.nodeType == TEXT_NODE && parent.nodeType == DOCUMENT_NODE) ||
       (node.nodeType == DOCUMENT_TYPE_NODE && parent.nodeType != DOCUMENT_NODE))
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
    if(parent.nodeType == DOCUMENT_NODE) {
      var doc : Document = cast parent;
      if(node.nodeType == DOCUMENT_FRAGMENT_NODE) {
        var frag : DocumentFragment = cast node;
        if(frag.childElementCount > 1 || frag.textContent != null) // TODO, or != ""? or it is not enough?
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
        if(frag.childElementCount == 1) {
          if(doc.documentElement != null || (null != child && child.nodeType == DOCUMENT_TYPE_NODE) // ||
          // TODO child is not null and a doctype is following child
        )
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
        }
      } else if(node.nodeType == ELEMENT_NODE) {
        if(doc.documentElement != null ||
          (null != child && child.nodeType == DOCUMENT_TYPE_NODE) //||
          //(null != child && )
          // TODO child is not null and a doctype is following child
        )
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
      } else if(node.nodeType == DOCUMENT_TYPE_NODE) {
        if(doc.doctype != null)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
        else if(child.previousSibling != null && child.previousSibling.nodeType == ELEMENT_NODE)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
        else if(null == child && doc.documentElement != null)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
      }
    }
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

  static function isDescendant(ancestor : DOMNode, node : DOMNode) {
    node = node.parentNode;
    while(node != null) {
      if(node == ancestor)
        return true;
      node = node.parentNode;
    }
    return false;
  }

  static function isInclusiveDescendant(ancestor : DOMNode, node : DOMNode)
    return ancestor == node || isDescendant(ancestor, node);

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

  public function appendChild(node : DOMNode) : DOMNode
    return insertBefore(node, null);

  public function replaceChild(node : DOMNode, child : DOMNode) : DOMNode {
    return throw "not implemented";
  }
  public function removeChild(child : DOMNode) : DOMNode {
    if(child.parentNode != this)
      throw DOMException.fromCode(NOT_FOUND_ERR);
    parentRemoveChild(child);
    return child;
  }

  function parentRemoveChild(node : DOMNode, ?suppressObservers = false) {
    var index = childNodesImpl.indexOf(node);
    // TODO operate on ranges (steps 2 to 5): https://dom.spec.whatwg.org/#concept-node-remove

    // TODO change NodeIteratos (step 6): https://dom.spec.whatwg.org/#concept-node-remove

    var oldPreviousSibling = node.previousSibling;
    childNodesImpl.removeChild(node);
    // TODO 9?

    // TODO suppress observers (step 10, 11): https://dom.spec.whatwg.org/#concept-node-remove
  }

  var childNodesImpl : thx.xml.NodeList.NodeListImp;
  function new(nodeType : NodeType, nodeName : DOMString, baseURI : DOMString, ownerDocument : Document) {
    this.nodeType = nodeType;
    this.nodeName = nodeName;
    this.baseURI = baseURI;
    this.ownerDocument = ownerDocument;
    this.childNodesImpl = new thx.xml.NodeList.NodeListImp();
    this.childNodes = this.childNodesImpl;
    super();
  }
}
