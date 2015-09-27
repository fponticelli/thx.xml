package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.ProcessingInstruction as DOMProcessingInstruction;

class ProcessingInstruction
    extends CharacterData
    implements DOMProcessingInstruction {
  public var target(default, null) : DOMString;

  function new(target : DOMString, ownerDocument : Document) {
    this.target = target;
    super(PROCESSING_INSTRUCTION_NODE, target, baseURI, ownerDocument);
  }
}
