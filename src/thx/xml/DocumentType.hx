package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.DocumentType as DOMDocumentType;

class DocumentType extends Node implements DOMDocumentType {
  public var name(default, null) : DOMString;
  public var publicId(default, null) : DOMString;
  public var systemId(default, null) : DOMString;


  public function remove() : Void {
    return throw "not implemented";
  }

  function new(name : DOMString, publicId : DOMString, systemId : DOMString, baseURI : DOMString, ownerDocument : Document) {
    this.name = name;
    this.publicId = publicId;
    this.systemId = systemId;
    super(DOCUMENT_TYPE_NODE, name, baseURI, ownerDocument);
  }
}
