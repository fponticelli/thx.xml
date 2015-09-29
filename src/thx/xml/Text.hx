package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Text as DOMText;

class Text
    extends CharacterData
    implements DOMText {
  public function splitText(offset : Int) : DOMText {
    // TODO
    return throw "not implemented";
  }
  public var wholeText(default, null) : DOMString;

  function new(data : DOMString, baseURI : DOMString, ownerDocument : Document) {
    super(TEXT_NODE, "#text", data, baseURI, ownerDocument);
  }
}
