package thx.xml.dom;

import thx.xml.dom.NodeFilter;

interface Document
    extends ParentNode
    extends Node
    extends NonElementParentNode {
  // [SameObject]
  var implementation(default, null) : DOMImplementation;
  var URL(default, null) : DOMString;
  var documentURI(default, null) : DOMString;
  var origin(default, null) : DOMString;
  var compatMode(default, null) : DOMString;
  var characterSet(default, null) : DOMString;
  var contentType(default, null) : DOMString;

  var doctype(default, null) : DocumentType;
  var documentElement(default, null) : Null<Element>;
  function getElementsByTagName(localName : DOMString) : HTMLCollection;
  function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : HTMLCollection;
  function getElementsByClassName(classNames : DOMString) : HTMLCollection;

  function createElement(localName : DOMString) : Element;
  function createElementNS(namespace : Null<DOMString>, qualifiedName : DOMString) : Element;
  function createDocumentFragment() : DocumentFragment;
  function createTextNode(data : DOMString) : Text;
  function createComment(data : DOMString) : Comment;
  function createProcessingInstruction(target : DOMString, data : DOMString) : ProcessingInstruction;

  function importNode(node : Node, ?deep : Bool = false) : Node;
  function adoptNode(node : Node) : Node;

  function createEvent(interfaceName : DOMString) : Event;

  function createRange() : Range;

  // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  function createNodeIterator(root : Node, ?whatToShow : WhatToShow = 0xFFFFFFFF, ?filter : NodeFilter) : NodeIterator;
  function createTreeWalker(root : Node, ?whatToShow : WhatToShow = 0xFFFFFFFF, ?filter : NodeFilter) : TreeWalker;
}
