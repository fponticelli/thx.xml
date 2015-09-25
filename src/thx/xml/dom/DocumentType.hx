package thx.xml.dom;

interface DocumentType extends ChildNode {
  var name(default, null) : DOMString;
  var publicId(default, null) : DOMString;
  var systemId(default, null) : DOMString;
}
