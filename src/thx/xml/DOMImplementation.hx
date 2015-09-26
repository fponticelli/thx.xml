package thx.xml;

import thx.xml.dom.DocumentType;
import thx.xml.dom.DOMString;
import thx.xml.dom.XMLDocument;

class DOMImplementation implements thx.xml.dom.DOMImplementation {
  public function createDocumentType(qualifiedName : DOMString, publicId : DOMString, systemId : DOMString) : DocumentType {
    return throw "not implemented";
  }
  public function createDocument(namespace : Null<DOMString>, /*[TreatNullAs=EmptyString]*/ ?qualifiedName : DOMString, ?doctype : DocumentType) : XMLDocument {
    return throw "not implemented";
  }
  public function createHTMLDocument(?title : DOMString) : Document {
    return throw "not implemented";
  }

  // useless; always returns true
  public function hasFeature() : Bool {
    return throw "not implemented";
  }
}
