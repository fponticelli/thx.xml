package thx.xml;

using thx.Strings;
import thx.xml.NodeFilter;

class Document extends Node {
  // [SameObject]
  public var implementation(default, null) : DOMImplementation;
  public var URL(default, null) : DOMString;
  public var documentURI(default, null) : DOMString;
  public var origin(default, null) : DOMString;
  public var compatMode(default, null) : DOMString;
  public var characterSet(default, null) : DOMString;
  public var contentType(default, null) : DOMString;

  public var doctype(default, null) : DocumentType;
  public var documentElement(default, null) : Null<Element>;
  public function getElementsByTagName(localName : DOMString) : HTMLCollection {
    // TODO getElementsByTagName
    return throw new thx.error.NotImplemented();
  }
  public function getElementsByTagNameNS(namespace : Null<DOMString>, localName : DOMString) : HTMLCollection {
    // TODO getElementsByTagNameNS
    return throw new thx.error.NotImplemented();
  }
  public function getElementsByClassName(classNames : DOMString) : HTMLCollection {
    // TODO getElementsByClassName
    return throw new thx.error.NotImplemented();
  }

  public function createElement(localName : DOMString) : Element {
    validateName(localName);
    // If the context object is an HTML document, let localName be converted to ASCII lowercase.
    // https://dom.spec.whatwg.org/#html-document
    // TODO createElement
    return new Element(localName, null, Namespaces.html, this);
  }

  @:access(thx.xml.Element.new)
  public function createElementNS(namespace : Null<DOMString>, qualifiedName : DOMString) : Element {
    var o = validateAndExtract(namespace, qualifiedName);
    // TODO createElementNS rethrow? not needed but nice to have
    // TODO createElementNS check if ownerDocument is applied this way
    return new Element(o.localName, o.prefix, o.namespace, this);
  }
  @:access(thx.xml.DocumentFragment.new)
  public function createDocumentFragment() : DocumentFragment {
    return new DocumentFragment(this);
  }
  @:access(thx.xml.Text.new)
  public function createTextNode(data : DOMString) : Text {
    return new Text(data, this);
  }
  @:access(thx.xml.Comment.new)
  public function createComment(data : DOMString) : Comment {
    return new Comment(data, this);
  }
  @:access(thx.xml.ProcessingInstruction.new)
  public function createProcessingInstruction(target : DOMString, data : DOMString) : ProcessingInstruction {
    validateName(target);
    if(data.contains("?>"))
      throw DOMException.fromCode(INVALID_CHARACTER_ERR);
    return new ProcessingInstruction(target, data, this);
  }

  public function importNode(node : Node, ?deep : Bool = false) : Node {
    // TODO importNode
    return throw new thx.error.NotImplemented();
  }
  public function adoptNode(node : Node) : Node {
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
    return throw new thx.error.NotImplemented();
  }

  public function createRange() : Range {
    // TODO createRange
    return throw new thx.error.NotImplemented();
  }

  // NodeFilter.SHOW_ALL = 0xFFFFFFFF
  public function createNodeIterator(root : Node, ?whatToShow : WhatToShow, ?filter : NodeFilter) : NodeIterator {
    // TODO createNodeIterator
    return throw new thx.error.NotImplemented();
  }
  public function createTreeWalker(root : Node, ?whatToShow : WhatToShow, ?filter : NodeFilter) : TreeWalker {
    // TODO createTreeWalker
    return throw new thx.error.NotImplemented();
  }


  public function getElementById(id : String) : Null<Element> {
    // TODO getElementById
    return throw new thx.error.NotImplemented();
  }

  public var children(default, null) : HTMLCollection;
  public var firstElementChild(default, null) : Null<Element>;
  public var lastElementChild(default, null) : Null<Element>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<Element> {
    // TODO querySelector
    return throw new thx.error.NotImplemented();
  }
  public function querySelectorAll(selectors : DOMString) : NodeList {
    // TODO querySelectorAll
    return throw new thx.error.NotImplemented();
  }

  var _baseURI : DOMString;
  public function new(?baseURI : DOMString) {
    _baseURI = baseURI;
    super(DOCUMENT_NODE, "#document", null);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherDocument : Document = cast other;
    if(childNodes.length != otherDocument.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherDocument.childNodes[i]))
        return false;
    return true;
  }

  override function get_baseURI()
    return _baseURI;

  // NON-STANDARD
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

@:access(thx.xml.Document.new)
class Documents {
  public static function toDom4(xml : Xml) : Document {
    var doc = new Document(null);
    switch [xml.nodeType, xml.firstChild()] {
      case [Document, child] if(child.nodeType == Xml.DocType):
        appendToDom(child, doc, doc);
        xml = child.firstElement();
      case [Document, child]:
        xml = child.firstElement();
      case _:
    }
    if(null != xml)
      appendToDom(xml, doc, doc);
    return doc;
  }

  static function appendToDom(xml : Xml, node : Node, doc : Document) {
    switch xml.nodeType {
      case ProcessingInstruction:
        // TODO
      case DocType:
        // TODO
      case Comment:
        node.appendChild(doc.createComment(xml.nodeValue));
      case CData:
        // TODO
      case PCData:
        // TODO
      case Element:
        var child = doc.createElement(xml.nodeName);
        for(attr in xml.attributes())
          child.setAttribute(attr, xml.get(attr));
        node.appendChild(child);
        for(n in xml.iterator())
          appendToDom(n, child, doc);
      case _:
        throw new thx.Error('invalid xml nodeType ${xml.nodeType}');
    }
  }
}
