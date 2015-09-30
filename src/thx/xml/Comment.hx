package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.Comment as DOMComment;

class Comment
  extends CharacterData
  implements DOMComment {
  function new(data : DOMString, ownerDocument : Document) {
    super(COMMENT_NODE, "#comment", data, ownerDocument);
  }
}
