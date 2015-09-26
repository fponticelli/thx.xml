package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.ProcessingInstruction as DOMProcessingInstruction;

class ProcessingInstruction
  extends CharacterData
  implements DOMProcessingInstruction {
    public var target(default, null) : DOMString;
}
