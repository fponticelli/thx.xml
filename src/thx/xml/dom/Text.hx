package thx.xml.dom;

interface Text
  extends CharacterData {
    function splitText(offset : Int) : Text;
    var wholeText(default, null) : DOMString;
}
