package thx.xml.dom;

interface Element
    extends Node
    extends ParentNode
    extends NonDocumentTypeChildNode
    extends ChildNode {

  var namespaceURI(default, null) : Null<DOMString>;
  var prefix(default, null) : Null<DOMString>;
  var localName(default, null) : DOMString;
  var tagName(default, null) : DOMString;

  var id : DOMString;
  var className : DOMString;
  // [SameObject]
  var classList(default, null) : DOMTokenList;

  // [SameObject]
  var attributes(default, null) : Array<Attr>;
  function getAttribute(name : DOMString) : Null<DOMString>;
  function getAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Null<DOMString>;
  function setAttribute(name : DOMString, value : DOMString) : Void;
  function setAttributeNS(namespace : Null<DOMString>, name : DOMString, value : DOMString) : Void;
  function removeAttribute(name : DOMString) : Void;
  function removeAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Void;
  function hasAttribute(name : DOMString) : Bool;
  function hasAttributeNS(namespace : Null<DOMString>, localName : DOMString) : Bool;

  function getElementsByTagName(localName : DOMString) : HTMLCollection;
  function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : HTMLCollection;
  function getElementsByClassName(classNames : DOMString) : HTMLCollection;
}
