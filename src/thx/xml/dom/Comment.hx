package thx.xml.dom;

interface Comment
  extends CharacterData {
    var target(default, null) : DOMString;
}
