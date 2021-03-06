package thx.xml;

import thx.xml.Node.NodeType;

class CharacterData
    extends Node
    implements NonDocumentTypeChildNode
    implements ChildNode {
  // [TreatNullAs=EmptyString]
  public var data : DOMString;
  public var length(default, null) : Int;
  public function substringData(offset : Int, count : Int) : DOMString {
    // TODO substringData
    return throw new thx.error.NotImplemented();
  }
  public function appendData(data : DOMString) : Void {
    // TODO appendData
    return throw new thx.error.NotImplemented();
  }
  public function insertData(offset : Int, data : DOMString) : Void {
    // TODO insertData
    return throw new thx.error.NotImplemented();
  }
  public function deleteData(offset : Int, count : Int) : Void {
    // TODO deleteData
    return throw new thx.error.NotImplemented();
  }
  public function replaceData(offset : Int, count : Int, data : DOMString) : Void {
    // TODO replaceData
    return throw new thx.error.NotImplemented();
  }
  public function remove() : Void {
    // TODO remove
    return throw new thx.error.NotImplemented();
  }
  public var nextElementSibling : Null<Element>;
  public var previousElementSibling : Null<Element>;

  function new(nodeType : NodeType, nodeName : DOMString, data : DOMString, ownerDocument : thx.xml.Document) {
    this.data = null == data ? "" : data;
    this.length = this.data.length;
    super(nodeType, nodeName, ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherCD : CharacterData = cast other;
    return data == otherCD.data;
  }
}
