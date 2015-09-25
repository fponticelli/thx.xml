package thx.xml.dom;

interface ProcessingInstruction
  extends CharacterData {
    var target(default, null) : DOMString;
}
