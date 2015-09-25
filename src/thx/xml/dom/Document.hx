package thx.xml.dom;

interface Document
  extends ParentNode
  extends Node {
  // [SameObject] readonly attribute DOMImplementation implementation;
  // readonly attribute DOMString URL;
  // readonly attribute DOMString documentURI;
  // readonly attribute DOMString origin;
  // readonly attribute DOMString compatMode;
  // readonly attribute DOMString characterSet;
  // readonly attribute DOMString contentType;
  //
  // readonly attribute DocumentType? doctype;
  // readonly attribute Element? documentElement;
  // HTMLCollection getElementsByTagName(DOMString localName);
  // HTMLCollection getElementsByTagNameNS(DOMString? namespace, DOMString localName);
  // HTMLCollection getElementsByClassName(DOMString classNames);
  //
  // [NewObject] Element createElement(DOMString localName);
  // [NewObject] Element createElementNS(DOMString? namespace, DOMString qualifiedName);
  // [NewObject] DocumentFragment createDocumentFragment();
  // [NewObject] Text createTextNode(DOMString data);
  // [NewObject] Comment createComment(DOMString data);
  // [NewObject] ProcessingInstruction createProcessingInstruction(DOMString target, DOMString data);
  //
  // Node importNode(Node node, optional boolean deep = false);
  // Node adoptNode(Node node);
  //
  // [NewObject] Event createEvent(DOMString interface);
  //
  // [NewObject] Range createRange();
  //
  // // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  // [NewObject] NodeIterator createNodeIterator(Node root, optional unsigned long whatToShow = 0xFFFFFFFF, optional NodeFilter? filter = null);
  // [NewObject] TreeWalker createTreeWalker(Node root, optional unsigned long whatToShow = 0xFFFFFFFF, optional NodeFilter? filter = null);
}
