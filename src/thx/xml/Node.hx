package thx.xml;

import thx.xml.NodeList;

class Node extends EventTarget {
  public var nodeType(default, null) : NodeType;
  public var nodeName(default, null) : DOMString;

  public var baseURI(get, null) : Null<DOMString>;

  public var ownerDocument(default, null) : Null<Document>;
  public var parentNode(default, null) : Null<Node>;
  public var parentElement(default, null) : Null<Element>;
  public function hasChildNodes() : Bool
    return null != firstChild;
  public var childNodes(default, null) : NodeList;
  public var firstChild(default, null) : Null<Node>;
  public var lastChild(default, null) : Null<Node>;
  public var previousSibling(default, null) : Null<Node>;
  public var nextSibling(default, null) : Null<Node>;

  public var nodeValue : Null<DOMString>;
  public var textContent : Null<DOMString>;
  public function normalize() : Void {
    // TODO normalize
    return throw "not implemented";
  }

  public function cloneNode(?deep : Bool = false) : Node {
    // TODO cloneNode
    return throw "not implemented";
  }
  // requires subclasses to call super.isEqualNode() first
  public function isEqualNode(?other : Node) : Bool {
    return null != other && nodeType == other.nodeType;
  }

  public function compareDocumentPosition(other : Node) : DocumentPosition {
    // TODO compareDocumentPosition
    return throw "not implemented";
  }
  public function contains(?other : Node) : Bool {
    if(null == other)
      return false;
    return isInclusiveDescendant(this, other);
  }

  @:access(thx.xml.Element.locateNamespacePrefix)
  public function lookupPrefix(namespace : Null<DOMString>) : Null<DOMString> {
    if(namespace == null || namespace == "")
      return null;
    // TODO lookupPrefix, move this to subclass
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
    // TODO lookupNamespaceURI, move this to subclass
    if("" == prefix) prefix = null;
    return switch nodeType {
      case ELEMENT_NODE:
        var el : Element = cast this;
        if(el.namespaceURI != null && el.prefix == prefix)
          el.namespaceURI;
        // TODO lookupNamespaceURI, add more cases from step 2: https://dom.spec.whatwg.org/#locate-a-namespace
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

  // TODO override in subclasses
  public function insertBefore(node : Node, ?child : Null<Node>) : Node {
    // ensure pre-insertion validity
    ensurePreInsertionValidity(node, child);

    // Let reference child be child
    var referenceChild = child;

    // If reference child is node, set it to node’s next sibling
    if(referenceChild == node)
      referenceChild = node.nextSibling;

    var doc : Document = switch this.nodeType {
                case NodeType.DOCUMENT_NODE: cast this;
                case _: ownerDocument;
              };

    // Adopt node into parent’s node document
    adopt(doc, node);

    // Insert node into parent before reference child
    childNodesImpl.insertBefore(node, child);

    // custom TODO: check
    if(null == firstChild)
      firstChild = node;

    if(null == lastChild || null == child)
      lastChild = node;

    // Return node
    return node;
  }

  static function adopt(doc : Document, node : Node) {
    if(null != node.parentNode)
      node.parentNode.removeChild(node);
    doc.adoptNode(node);
  }

  function ensurePreInsertionValidity(node : Node, ?child : Node, ?pos : haxe.PosInfos) {
    // TODO ensurePreInsertionValidity, move this to subclass
    if(this.nodeType != DOCUMENT_NODE &&
       this.nodeType != DOCUMENT_FRAGMENT_NODE &&
       this.nodeType != ELEMENT_NODE)
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
    if(isHostIncludingInclusiveAncestor(this, node))
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
    if(null != child && child.parentNode != this)
      throw DOMException.fromCode(NOT_FOUND_ERR, pos);
    if(node.nodeType != DOCUMENT_FRAGMENT_NODE &&
       node.nodeType != DOCUMENT_TYPE_NODE &&
       node.nodeType != ELEMENT_NODE &&
       node.nodeType != TEXT_NODE &&
       node.nodeType != PROCESSING_INSTRUCTION_NODE &&
       node.nodeType != COMMENT_NODE)
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
    if((node.nodeType == TEXT_NODE && this.nodeType == DOCUMENT_NODE) ||
       (node.nodeType == DOCUMENT_TYPE_NODE && this.nodeType != DOCUMENT_NODE))
      throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
    if(this.nodeType == DOCUMENT_NODE) {
      var doc : Document = cast this;
      if(node.nodeType == DOCUMENT_FRAGMENT_NODE) {
        var frag : DocumentFragment = cast node;
        if(frag.childElementCount > 1 || frag.textContent != null) // TODO, or != ""? or it is not enough?
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
        if(frag.childElementCount == 1) {
          if(doc.documentElement != null || (null != child && child.nodeType == DOCUMENT_TYPE_NODE) // ||
          // TODO ensurePreInsertionValidity, child is not null and a doctype is following child
        )
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR);
        }
      } else if(node.nodeType == ELEMENT_NODE) {
        if(doc.documentElement != null ||
          (null != child && child.nodeType == DOCUMENT_TYPE_NODE) //||
          //(null != child && )
          // TODO ensurePreInsertionValidity, child is not null and a doctype is following child
        )
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
      } else if(node.nodeType == DOCUMENT_TYPE_NODE) {
        if(doc.doctype != null)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
        else if(child.previousSibling != null && child.previousSibling.nodeType == ELEMENT_NODE)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
        else if(null == child && doc.documentElement != null)
          throw DOMException.fromCode(HIERARCHY_REQUEST_ERR, pos);
      }
    }
  }

  static function getRoot(node : Node) : Node {
    while(null != node.parentNode)
      node = node.parentNode;
    return node;
  }

  static function isAncestor(ancestor : Node, node : Node) {
    while(node.parentNode != null) {
      if(node.parentNode == ancestor)
        return true;
      node = node.parentNode;
    }
    return false;
  }

  static function isHostIncludingInclusiveAncestor(ancestor : Node, node : Node) {
    return isInclusiveAncestor(ancestor, node) || false; // TODO isHostIncludingInclusiveAncestor, needs to implement the
    // second part of https://dom.spec.whatwg.org/#concept-tree-host-including-inclusive-ancestor
  }

  static function isInclusiveAncestor(ancestor : Node, node : Node)
    return ancestor == node || isAncestor(ancestor, node);

  static function isDescendant(ancestor : Node, node : Node) {
    node = node.parentNode;
    while(node != null) {
      if(node == ancestor)
        return true;
      node = node.parentNode;
    }
    return false;
  }

  static function isInclusiveDescendant(ancestor : Node, node : Node)
    return ancestor == node || isDescendant(ancestor, node);

  static function isSibling(subject : Node, node : Node) {
    if(subject.parentNode == null || node.parentNode == null)
      return false;
    return subject.parentNode == node.parentNode;
  }

  static function isInclusiveSibling(subject : Node, node : Node)
    return subject == node || isSibling(subject, node);

  static function getNodeAncestors(node : Node) : Array<Node> {
    var arr : Array<Node> = [];
    node = node.parentNode;
    while(null != node) {
      arr.insert(0, node);
      node = node.parentNode;
    }
    return arr;
  }

  // TODO getAncestors, a little disgusting unsafe cast
  override function getAncestors() : Array<EventTarget>
    return cast getNodeAncestors(this);

  public function appendChild(node : Node) : Node
    return insertBefore(node, null);

  public function replaceChild(node : Node, child : Node) : Node {
    // TODO replaceChild
    return throw "not implemented";
  }
  public function removeChild(child : Node) : Node {
    if(child.parentNode != this)
      throw DOMException.fromCode(NOT_FOUND_ERR);
    parentRemoveChild(child);
    return child;
  }

  // NON-STANDARD
  public function toString() {
    return thx.xml.io.XMLWriter.nodeToBytes(this).toString();
  }

  function parentRemoveChild(node : Node, ?suppressObservers = false) {
    var index = childNodesImpl.indexOf(node);
    // TODO parentRemoveChild, operate on ranges (steps 2 to 5): https://dom.spec.whatwg.org/#concept-node-remove

    // TODO parentRemoveChild, change NodeIterator (step 6): https://dom.spec.whatwg.org/#concept-node-remove

    var oldPreviousSibling = node.previousSibling;
    childNodesImpl.removeChild(node);
    // TODO parentRemoveChild, 9?

    // TODO parentRemoveChild, suppress observers (step 10, 11): https://dom.spec.whatwg.org/#concept-node-remove
  }

  var childNodesImpl : NodeListImpl;
  function new(nodeType : NodeType, nodeName : DOMString, ownerDocument : Document) {
    this.nodeType = nodeType;
    this.nodeName = nodeName;
    this.ownerDocument = ownerDocument;
    this.childNodesImpl = new NodeListImpl();
    this.childNodes = this.childNodesImpl;
    super();
  }

  function get_baseURI()
    return ownerDocument.baseURI;
}

@:enum
abstract NodeType(Int) to Int {
  var ELEMENT_NODE : NodeType = 1;
  var ATTRIBUTE_NODE : NodeType = 2; // historical
  var TEXT_NODE : NodeType = 3;
  var CDATA_SECTION_NODE : NodeType = 4; // historical
  var ENTITY_REFERENCE_NODE : NodeType = 5; // historical
  var ENTITY_NODE : NodeType = 6; // historical
  var PROCESSING_INSTRUCTION_NODE : NodeType = 7;
  var COMMENT_NODE : NodeType = 8;
  var DOCUMENT_NODE : NodeType = 9;
  var DOCUMENT_TYPE_NODE : NodeType = 10;
  var DOCUMENT_FRAGMENT_NODE : NodeType = 11;
  var NOTATION_NODE : NodeType = 12; // historical
}

@:enum
abstract DocumentPosition(Int) to Int {
  var DOCUMENT_POSITION_DISCONNECTED : DocumentPosition = 0x01;
  var DOCUMENT_POSITION_PRECEDING : DocumentPosition = 0x02;
  var DOCUMENT_POSITION_FOLLOWING : DocumentPosition = 0x04;
  var DOCUMENT_POSITION_CONTAINS : DocumentPosition = 0x08;
  var DOCUMENT_POSITION_CONTAINED_BY : DocumentPosition = 0x10;
  var DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC : DocumentPosition = 0x20;
}
