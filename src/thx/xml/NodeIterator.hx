package thx.xml;

import thx.xml.NodeFilter;

class NodeIterator {
  // [SameObject]
  public var root(default, null) : Node;
  public var referenceNode(default, null) : Node;
  public var pointerBeforeReferenceNode(default, null) : Bool;
  public var whatToShow(default, null) : WhatToShow;
  public var filter(default, null) : Null<NodeFilter>;

  public function nextNode() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function previousNode() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }

  public function detach() : Void {
    return throw new thx.error.NotImplemented();
  }
}
