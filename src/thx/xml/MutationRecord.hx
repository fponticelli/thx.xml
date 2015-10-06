package thx.xml;

class MutationRecord {
  public var type(default, null) : DOMString;
  public var target(default, null) : Node;
  public var addedNodes(default, null) : NodeList;
  public var removedNodes(default, null) : NodeList;
  public var previousSibling(default, null) : Null<Node>;
  public var nextSibling(default, null) : Null<Node>;
  public var attributeName(default, null) : Null<DOMString>;
  public var attributeNamespace(default, null) : Null<DOMString>;
  public var oldValue(default, null) : Null<DOMString>;
}
