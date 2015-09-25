package thx.xml.dom;

interface DOMImplementation {
  function createDocumentType(qualifiedName : DOMString, publicId : DOMString, systemId : DOMString) : DocumentType;
  function createDocument(namespace : Null<DOMString>, /*[TreatNullAs=EmptyString]*/ ?qualifiedName : DOMString, ?doctype : DocumentType) : XMLDocument;
  function createHTMLDocument(?title : DOMString) : Document;

  // useless; always returns true
  function hasFeature() : Bool;
}
