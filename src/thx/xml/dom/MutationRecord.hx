package thx.xml.dom;

interface MutationRecord {
  var type(default, null) : DOMString;
  var target(default, null) : Node;
  var addedNodes(default, null) : NodeList;
  var removedNodes(default, null) : NodeList;
  var previousSibling(default, null) : Null<Node>;
  var nextSibling(default, null) : Null<Node>;
  var attributeName(default, null) : Null<DOMString>;
  var attributeNamespace(default, null) : Null<DOMString>;
  var oldValue(default, null) : Null<DOMString>;
}
