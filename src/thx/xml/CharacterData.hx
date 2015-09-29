package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.CharacterData as DOMCharacterData;
import thx.xml.dom.Node.NodeType;

class CharacterData extends Node implements DOMCharacterData {
  // [TreatNullAs=EmptyString]
  public var data : DOMString;
  public var length(default, null) : Int;
  public function substringData(offset : Int, count : Int) : DOMString {
    // TODO
    return throw "not implemented";
  }
  public function appendData(data : DOMString) : Void {
    // TODO
    return throw "not implemented";
  }
  public function insertData(offset : Int, data : DOMString) : Void {
    // TODO
    return throw "not implemented";
  }
  public function deleteData(offset : Int, count : Int) : Void {
    // TODO
    return throw "not implemented";
  }
  public function replaceData(offset : Int, count : Int, data : DOMString) : Void {
    // TODO
    return throw "not implemented";
  }
  public function remove() : Void {
    // TODO
    return throw "not implemented";
  }
  public var nextElementSibling : Null<DOMElement>;
  public var previousElementSibling : Null<DOMElement>;

  function new(nodeType : NodeType, nodeName : DOMString, data : DOMString, baseURI : DOMString, ownerDocument : Document) {
    this.data = data;
    super(nodeType, nodeName, baseURI, ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.dom.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherCD : CharacterData = cast other;
    return data == otherCD.data;
  }
}
