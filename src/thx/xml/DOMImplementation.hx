package thx.xml;

class DOMImplementation {
  public function createDocumentType(qualifiedName : DOMString, publicId : DOMString, systemId : DOMString) : DocumentType {
    // TODO createDocumentType
    return throw "not implemented";
  }
  public function createDocument(namespace : Null<DOMString>, /*[TreatNullAs=EmptyString]*/ ?qualifiedName : DOMString, ?doctype : DocumentType) : XMLDocument {
    // TODO createDocument
    return throw "not implemented";
  }
  public function createHTMLDocument(?title : DOMString) : Document {
    // TODO createHTMLDocument
    return throw "not implemented";
  }

  // useless; always returns true
  public function hasFeature() : Bool {
    // TODO hasFeature
    return throw "not implemented";
  }
}
