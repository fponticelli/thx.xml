package thx.xml;

class DocumentType
    extends Node
    implements ChildNode {
  public var name(default, null) : DOMString;
  public var publicId(default, null) : DOMString;
  public var systemId(default, null) : DOMString;


  public function remove() : Void {
    // TODO remove
    return throw "not implemented";
  }

  function new(name : DOMString, publicId : DOMString, systemId : DOMString, ownerDocument : Document) {
    this.name = name;
    this.publicId = publicId;
    this.systemId = systemId;
    super(DOCUMENT_TYPE_NODE, name, ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherDocType : DocumentType = cast other;
    return name == otherDocType.name && publicId == otherDocType.publicId && systemId == otherDocType.systemId;
  }
}
