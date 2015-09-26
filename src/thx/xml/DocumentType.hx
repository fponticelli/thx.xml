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
}
