package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Text as DOMText;

class Text
    extends CharacterData
    implements DOMText {
  public function splitText(offset : Int) : DOMText {
    if(offset > length)
      throw DOMException.fromCode(INDEX_SIZE_ERR);
    var count = length - offset,
        newdata = data.substring(offset, offset + count),
        newnode = new Text(newdata, baseURI, ownerDocument);
    if(null != parentNode) {
      // TODO splitText, step 7
      // https://dom.spec.whatwg.org/#concept-Text-split
      parentNode.insertBefore(newnode, nextSibling);
    }
    replaceData(offset, count, "");
    if(null == parentNode) {
      // TODO splitText, step 9
      // https://dom.spec.whatwg.org/#concept-Text-split
    }
    return newnode;
  }
  public var wholeText(get, null) : DOMString;

  function new(data : DOMString, baseURI : DOMString, ownerDocument : thx.xml.dom.Document) {
    super(TEXT_NODE, "#text", data, baseURI, ownerDocument);
  }

  function get_wholeText() : DOMString
    return contiguousNodes().map(function(node) return node.data).join("");

  function contiguousNodes() {
    var nodes : Array<Text> = [this],
        node = this.previousSibling;
    while(node != null && node.nodeType == TEXT_NODE) {
      nodes.insert(0, cast node);
      node = node.previousSibling;
    }
    node = this.nextSibling;
    while(node != null && node.nodeType == TEXT_NODE) {
      nodes.push(cast node);
      node = node.nextSibling;
    }
    return nodes;
  }
}
