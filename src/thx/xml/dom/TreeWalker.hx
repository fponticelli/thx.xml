package thx.xml.dom;

import thx.xml.dom.NodeFilter;

interface TreeWalker {
  var root(default, null) : Node;
  var whatToShow(default, null) : WhatToShow;
  var filter(default, null) : Null<NodeFilter>;
  var currentNode : Node;

  function parentNode() : Null<Node>;
  function firstChild() : Null<Node>;
  function lastChild() : Null<Node>;
  function previousSibling() : Null<Node>;
  function nextSibling() : Null<Node>;
  function previousNode() : Null<Node>;
  function nextNode() : Null<Node>;
}
