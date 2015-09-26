package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.CharacterData as DOMCharacterData;

class CharacterData extends Node implements DOMCharacterData {
    // [TreatNullAs=EmptyString]
    public var data : DOMString;
    public var length(default, null) : Int;
    public function substringData(offset : Int, count : Int) : DOMString {
      return throw "not implemented";
    }
    public function appendData(data : DOMString) : Void {
      return throw "not implemented";
    }
    public function insertData(offset : Int, data : DOMString) : Void {
      return throw "not implemented";
    }
    public function deleteData(offset : Int, count : Int) : Void {
      return throw "not implemented";
    }
    public function replaceData(offset : Int, count : Int, data : DOMString) : Void {
      return throw "not implemented";
    }
    public function remove() : Void {
      return throw "not implemented";
    }
    public var nextElementSibling : Null<DOMElement>;
    public var previousElementSibling : Null<DOMElement>;
}
