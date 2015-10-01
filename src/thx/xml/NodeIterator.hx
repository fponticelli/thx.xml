package thx.xml;

import thx.xml.NodeFilter;

interface NodeIterator {
  // [SameObject]
  var root(default, null) : Node;
  var referenceNode(default, null) : Node;
  var pointerBeforeReferenceNode(default, null) : Bool;
  var whatToShow(default, null) : WhatToShow;
  var filter(default, null) : Null<NodeFilter>;

  function nextNode() : Null<Node>;
  function previousNode() : Null<Node>;

  function detach() : Void;
}
