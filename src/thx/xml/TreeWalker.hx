package thx.xml;

import thx.xml.NodeFilter;

class TreeWalker {
  public var root(default, null) : Node;
  public var whatToShow(default, null) : WhatToShow;
  public var filter(default, null) : Null<NodeFilter>;
  public var currentNode : Node;

  public function parentNode() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function firstChild() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function lastChild() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function previousSibling() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function nextSibling() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function previousNode() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
  public function nextNode() : Null<Node> {
    return throw new thx.error.NotImplemented();
  }
}
