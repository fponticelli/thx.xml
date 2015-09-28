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

  override public function isEqualNode(?other : thx.xml.dom.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherPI : DOMProcessingInstruction = cast other;
    return target == otherPI.target;
  }
}
