package thx.xml;

class DocumentFragment
  extends Node
  implements ParentNode
  implements NonElementParentNode {
  public function getElementById(id : String) : Null<Element> {
    // TODO getElementById
    return throw "not implemented";
  }

  public var children(default, null) : HTMLCollection;
  public var firstElementChild(default, null) : Null<Element>;
  public var lastElementChild(default, null) : Null<Element>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<Element> {
    // TODO querySelector
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : NodeList {
    // TODO querySelectorAll
    return throw "not implemented";
  }

  function new(ownerDocument : Document) {
    // TODO new, owner document?
    super(DOCUMENT_FRAGMENT_NODE, "#document-fragment", ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherDocumentFragment : DocumentFragment = cast other;
    if(childNodes.length != otherDocumentFragment.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherDocumentFragment.childNodes[i]))
        return false;
    return true;
  }
}
