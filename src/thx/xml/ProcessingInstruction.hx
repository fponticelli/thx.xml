package thx.xml;

class ProcessingInstruction extends CharacterData {
  public var target(default, null) : DOMString;

  function new(target : DOMString, data : DOMString, ownerDocument : Document) {
    this.target = target;
    super(PROCESSING_INSTRUCTION_NODE, target, data, ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherPI : ProcessingInstruction = cast other;
    return target == otherPI.target;
  }
}
