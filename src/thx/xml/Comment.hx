package thx.xml;

class Comment extends CharacterData {
  function new(data : DOMString, ownerDocument : Document) {
    super(COMMENT_NODE, "#comment", data, ownerDocument);
  }
}
