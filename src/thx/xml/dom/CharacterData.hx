package thx.xml.dom;

interface CharacterData
  extends NonDocumentTypeChildNode
  extends ChildNode
  extends Node {
    // [TreatNullAs=EmptyString]
    var data : DOMString;
    var length(default, null) : Int;
    function substringData(offset : Int, count : Int) : DOMString;
    function appendData(data : DOMString) : Void;
    function insertData(offset : Int, data : DOMString) : Void;
    function deleteData(offset : Int, count : Int) : Void;
    function replaceData(offset : Int, count : Int, data : DOMString) : Void;
}
