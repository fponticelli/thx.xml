package thx.xml.io;

import haxe.io.Bytes;
import haxe.io.Output;
import thx.xml.*;
using thx.Strings;

class XMLWriter {
  public static function nodeToBytes(node : Node) : Bytes {
    var buffer = new haxe.io.BytesOutput();
    var writer = new XMLWriter(buffer);
    writer.writeNode(node);
    return buffer.getBytes();
  }

  var stream : Output;
  var line : Int = 0;
  var pos : Int = 0;
  var level : Int = 0;
  var indentChar : String;
  var indentLength : Int;
  var oneIndent : String;
  public function new(stream : Output, indentChar : String = " ", indentLength : Int = 2) {
    this.stream = stream;
    this.indentChar = indentChar;
    this.indentLength = indentLength;
    this.oneIndent = indentChar.repeat(indentLength);
  }

  public function writeCharacterData(cd : CharacterData) {

  }

  public function writeComment(comment : Comment) {

  }

  public function writeDocument(doc : Document) {

  }

  public function writeDocumentType(docType : DocumentType) {

  }

  public function writeElement(el : Element) {
    // TODO add prefix
    write('<${el.localName}');
    for(attr in el.attributes) {
      write(' ');
      writeAttribute(attr);
    }

    write('>');
    for(node in el.childNodes)
      writeNode(node);

    write('</${el.localName}>');
  }

  public function writeNode(node : Node)
    switch node.nodeType {
      case ELEMENT_NODE:
        writeElement(cast node);
      case TEXT_NODE:
        writeText(cast node);
      case PROCESSING_INSTRUCTION_NODE:
        throw 'not implemented yet';
      case COMMENT_NODE:
        writeComment(cast node);
      case DOCUMENT_NODE:
        writeDocument(cast node);
      case DOCUMENT_TYPE_NODE:
        writeDocumentType(cast node);
      case DOCUMENT_FRAGMENT_NODE:
        throw 'not implemented yet';
      case _:
        throw new Error('unsupported node type ${node.nodeType}');
    };

  public function writeText(text : Text) {
    var content = text.data.htmlEscape(true); // TODO is this required?
    write(content);
  }

  public function writeAttribute(attr : Attr) {
    // TODO add prefix
    write(attr.name);
    write('="');
    write(attr.value.htmlEscape(true));
    write('"');
  }

  function indent() {
    for(i in 0...level)
      write(oneIndent);
  }

  function write(s : String) {
    pos += s.length;
    stream.writeString(s);
  }

  function newline() {
    stream.writeString("\n");
    line++;
    pos = 0;
  }
}
