package thx.xml.dom;

interface Node extends EventTarget {
  var nodeType(default, null) : NodeType;
  var nodeName(default, null) : DOMString;

  var baseURI(default, null) : Null<DOMString>;

  var ownerDocument(default, null) : Null<Document>;
  var parentNode(default, null) : Null<Node>;
  var parentElement(default, null) : Null<Element>;
  function hasChildNodes() : Bool;
  var childNodes(default, null) : NodeList;
  var firstChild(default, null) : Null<Node>;
  var lastChild(default, null) : Null<Node>;
  var previousSibling(default, null) : Null<Node>;
  var nextSibling(default, null) : Null<Node>;

  var nodeValue : Null<DOMString>;
  var textContent : Null<DOMString>;
  function normalize() : Void;

  function cloneNode(?deep : Bool = false) : Node;
  function isEqualNode(?other : Node) : Bool;

  function compareDocumentPosition(other : Node) : DocumentPosition;
  function contains(?other : Node) : Bool;

  function lookupPrefix(namespace : Null<DOMString>) : Null<DOMString>;
  function lookupNamespaceURI(prefix : Null<DOMString>) : Null<DOMString>;
  function isDefaultNamespace(namespace : Null<DOMString>) : Bool;

  function insertBefore(node : Node, child : Null<Node>) : Node;
  function appendChild(node : Node) : Node;
  function replaceChild(node : Node, child : Node) : Node;
  function removeChild(child : Node) : Node;
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
