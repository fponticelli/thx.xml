package thx.xml;

import thx.xml.dom.DocumentType;
import thx.xml.dom.DOMString;
import thx.xml.dom.XMLDocument;

class DOMImplementation implements thx.xml.dom.DOMImplementation {
  public function createDocumentType(qualifiedName : DOMString, publicId : DOMString, systemId : DOMString) : DocumentType {
    // TODO
    return throw "not implemented";
  }
  public function createDocument(namespace : Null<DOMString>, /*[TreatNullAs=EmptyString]*/ ?qualifiedName : DOMString, ?doctype : DocumentType) : XMLDocument {
    // TODO
    return throw "not implemented";
  }
  public function createHTMLDocument(?title : DOMString) : Document {
    // TODO
    return throw "not implemented";
  }

  // useless; always returns true
  public function hasFeature() : Bool {
    // TODO
    return throw "not implemented";
  }
}
