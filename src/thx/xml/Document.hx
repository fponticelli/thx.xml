package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.NodeFilter;
import thx.xml.dom.Document as DOMDocument;
import thx.xml.dom.Node as DOMNode;
import thx.xml.dom.DocumentFragment as DOMDocumentFragment;
import thx.xml.dom.DocumentType;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.HTMLCollection as DOMHTMLCollection;
import thx.xml.dom.Text as DOMText;
import thx.xml.dom.ProcessingInstruction as DOMProcessingInstruction;
import thx.xml.dom.Range as DOMRange;
import thx.xml.dom.NodeList as DOMNodeList;
import thx.xml.dom.NodeIterator as DOMNodeIterator;
import thx.xml.dom.TreeWalker as DOMTreeWalker;

class Document extends Node implements DOMDocument {
  // [SameObject]
  public var implementation(default, null) : thx.xml.dom.DOMImplementation;
  public var URL(default, null) : DOMString;
  public var documentURI(default, null) : DOMString;
  public var origin(default, null) : DOMString;
  public var compatMode(default, null) : DOMString;
  public var characterSet(default, null) : DOMString;
  public var contentType(default, null) : DOMString;

  public var doctype(default, null) : DocumentType;
  public var documentElement(default, null) : Null<DOMElement>;
  public function getElementsByTagName(localName : DOMString) : DOMHTMLCollection {
    return throw "not implemented";
  }
  public function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : DOMHTMLCollection {
    return throw "not implemented";
  }
  public function getElementsByClassName(classNames : DOMString) : DOMHTMLCollection {
    return throw "not implemented";
  }

  public function createElement(localName : DOMString) : DOMElement {
    return throw "not implemented";
  }
  public function createElementNS(namespace : Null<DOMString>, qualifiedName : DOMString) : DOMElement {
    return throw "not implemented";
  }
  public function createDocumentFragment() : DOMDocumentFragment {
    return throw "not implemented";
  }
  public function createTextNode(data : DOMString) : DOMText {
    return throw "not implemented";
  }
  public function createComment(data : DOMString) : Comment {
    return throw "not implemented";
  }
  public function createProcessingInstruction(target : DOMString, data : DOMString) : DOMProcessingInstruction {
    return throw "not implemented";
  }

  public function importNode(node : DOMNode, ?deep : Bool = false) : DOMNode {
    return throw "not implemented";
  }
  public function adoptNode(node : DOMNode) : DOMNode {
    if(node.nodeType == DOCUMENT_NODE)
      throw DOMException.fromCode(NOT_SUPPORTED_ERR);
    // TODO shadow root

    node.ownerDocument = this;
    for(node in childNodesImpl) {
      adoptNode(node);
    }
    return node;
  }

  public function createEvent(interfaceName : DOMString) : Event {
    return throw "not implemented";
  }

  public function createRange() : DOMRange {
    return throw "not implemented";
  }

  // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  public function createNodeIterator(root : DOMNode, ?whatToShow : WhatToShow, ?filter : NodeFilter) : DOMNodeIterator {
    return throw "not implemented";
  }
  public function createTreeWalker(root : DOMNode, ?whatToShow : WhatToShow, ?filter : NodeFilter) : DOMTreeWalker {
    return throw "not implemented";
  }


  public function getElementById(id : String) : Null<DOMElement> {
    return throw "not implemented";
  }

  public var children(default, null) : DOMHTMLCollection;
  public var firstElementChild(default, null) : Null<DOMElement>;
  public var lastElementChild(default, null) : Null<DOMElement>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<DOMElement> {
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : DOMNodeList {
    return throw "not implemented";
  }

  function new(baseURI : DOMString) {
    super(DOCUMENT_NODE, "#document", baseURI, null);
  }

  override public function isEqualNode(?other : thx.xml.dom.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherDocument : DOMDocument = cast other;
    if(childNodes.length != otherDocument.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherDocument.childNodes[i]))
        return false;
    return true;
  }
}
