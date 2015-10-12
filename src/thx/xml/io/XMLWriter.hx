package thx.xml.io;

import haxe.io.Output;
import thx.xml.*;

class XMLWriter {
  public static function nodeToString(node : Node) : String {
    var buffer = haxe.io.;
    var writer = new XMLWriter(buffer);
    return buffer.toString();
  }

  var stream : Output;
  public function new(stream : Output) {
    this.stream = stream;
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

  }

  public function writeNode(node : Node) {

  }

  public function writeText(text : Text) {

  }
}
