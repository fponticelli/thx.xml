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

using thx.Strings;

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
    // TODO getElementsByTagName
    return throw "not implemented";
  }
  public function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : DOMHTMLCollection {
    // TODO getElementsByTagNameNS
    return throw "not implemented";
  }
  public function getElementsByClassName(classNames : DOMString) : DOMHTMLCollection {
    // TODO getElementsByClassName
    return throw "not implemented";
  }

  public function createElement(localName : DOMString) : DOMElement {
    validateName(localName);
    // If the context object is an HTML document, let localName be converted to ASCII lowercase.
    // https://dom.spec.whatwg.org/#html-document
    // TODO
    return new Element(localName, null, Namespaces.html, null, this);
  }

  @:access(thx.xml.Element.new)
  public function createElementNS(namespace : Null<DOMString>, qualifiedName : DOMString) : DOMElement {
    var o = validateAndExtract(namespace, qualifiedName);
    // TODO createElementNS rethrow? not needed but nice to have
    // TODO createElementNS baseURI
    // TODO createElementNS check if ownerDocument is applied this way
    return new Element(o.localName, o.prefix, o.namespace, null, this);
  }
  @:access(thx.xml.DocumentFragment.new)
  public function createDocumentFragment() : DOMDocumentFragment {
    // TODO createDocumentFragment baseURI
    return new DocumentFragment(null, this);
  }
  @:access(thx.xml.Text.new)
  public function createTextNode(data : DOMString) : DOMText {
    // TODO createTextNode baseURI
    return new Text(data, null, this);
  }
  @:access(thx.xml.Comment.new)
  public function createComment(data : DOMString) : Comment {
    // TODO createComment baseURI
    return new Comment(data, null, this);
  }
  @:access(thx.xml.ProcessingInstruction.new)
  public function createProcessingInstruction(target : DOMString, data : DOMString) : DOMProcessingInstruction {
    validateName(target);
    if(data.contains("?>"))
      throw DOMException.fromCode(INVALID_CHARACTER_ERR);
    // TODO baseURI
    return new ProcessingInstruction(target, data, null, this);
  }

  public function importNode(node : DOMNode, ?deep : Bool = false) : DOMNode {
    // TODO importNode
    return throw "not implemented";
  }
  public function adoptNode(node : DOMNode) : DOMNode {
    if(node.nodeType == DOCUMENT_NODE)
      throw DOMException.fromCode(NOT_SUPPORTED_ERR);
    // TODO adoptNode shadow root

    node.ownerDocument = this;
    for(node in childNodesImpl) {
      adoptNode(node);
    }
    return node;
  }

  public function createEvent(interfaceName : DOMString) : Event {
    // TODO createEvent
    return throw "not implemented";
  }

  public function createRange() : DOMRange {
    // TODO createRange
    return throw "not implemented";
  }

  // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  public function createNodeIterator(root : DOMNode, ?whatToShow : WhatToShow, ?filter : NodeFilter) : DOMNodeIterator {
    // TODO createNodeIterator
    return throw "not implemented";
  }
  public function createTreeWalker(root : DOMNode, ?whatToShow : WhatToShow, ?filter : NodeFilter) : DOMTreeWalker {
    // TODO createTreeWalker
    return throw "not implemented";
  }


  public function getElementById(id : String) : Null<DOMElement> {
    // TODO getElementById
    return throw "not implemented";
  }

  public var children(default, null) : DOMHTMLCollection;
  public var firstElementChild(default, null) : Null<DOMElement>;
  public var lastElementChild(default, null) : Null<DOMElement>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<DOMElement> {
    // TODO querySelector
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : DOMNodeList {
    // TODO querySelectorAll
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

  static function validateName(localName : String) {
    // If qualifiedName does not match the Name production, throw an InvalidCharacterError exception.
    // http://www.w3.org/TR/xml/#NT-Name
    // TODO validateName
  }

  static function validateQName(qualifiedNamespace : String) {
    // If qualifiedName does not match the QName production, throw a NamespaceError exception.
    // http://www.w3.org/TR/xml-names/#NT-QName
    // TODO validateQName
  }

  static function validateQualifiedName(qualifiedNamespace : DOMString) {
    validateName(qualifiedNamespace);
    validateQName(qualifiedNamespace);
  }

  static function validateAndExtract(namespace : DOMString, qualifiedName : DOMString) {
    if(namespace == "") namespace = null;
    // Validate qualifiedName. Rethrow any exceptions.
    validateQualifiedName(qualifiedName);

    // Let prefix be null.
    var prefix = null;

    // Let localName be qualifiedName.
    var localName = qualifiedName;

    // If qualifiedName contains a ":" (U+003E), then split the string on it and set prefix to the part before and localName to the part after.
    var parts = qualifiedName.splitOnce(":");
    if(parts.length > 1) {
      prefix = parts[0];
      localName = parts[1];
    }

    // If prefix is non-null and namespace is null, throw a NamespaceError exception.
    if(null != prefix && null == namespace)
      throw DOMException.fromCode(NAMESPACE_ERR);

    // If prefix is "xml" and namespace is not the XML namespace, throw a NamespaceError exception.
    if("xml" == prefix && Namespaces.xml != namespace)
      throw DOMException.fromCode(NAMESPACE_ERR);

    // If either qualifiedName or prefix is "xmlns" and namespace is not the XMLNS namespace, throw a NamespaceError exception.
    if(("xmlns" == qualifiedName || "xmlns" == prefix) && namespace != Namespaces.xmlns)
      throw DOMException.fromCode(NAMESPACE_ERR);

    // If namespace is the XMLNS namespace and neither qualifiedName nor prefix is "xmlns", throw a NamespaceError exception.
    if(Namespaces.xmlns == namespace && qualifiedName != "xmlns" && prefix != "xmlns")
      throw DOMException.fromCode(NAMESPACE_ERR);

    // Return namespace, prefix, localName, and qualifiedName.
    return {
      namespace : namespace,
      prefix : prefix,
      localName : localName,
      qualifiedName : qualifiedName
    };
  }
}
