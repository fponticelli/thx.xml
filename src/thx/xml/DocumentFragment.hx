package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.DocumentFragment as DOMDocumentFragment;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.HTMLCollection as DOMHTMLCollection;
import thx.xml.dom.NodeList as DOMNodeList;

class DocumentFragment extends Node implements DOMDocumentFragment {
  public function getElementById(id : String) : Null<DOMElement> {
    // TODO
    return throw "not implemented";
  }

  public var children(default, null) : DOMHTMLCollection;
  public var firstElementChild(default, null) : Null<DOMElement>;
  public var lastElementChild(default, null) : Null<DOMElement>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<DOMElement> {
    // TODO
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : DOMNodeList {
    // TODO
    return throw "not implemented";
  }

  function new(baseURI : DOMString, ownerDocument : Document) {
    // TODO owner document?
    super(DOCUMENT_FRAGMENT_NODE, "#document-fragment", baseURI, ownerDocument);
  }

  override public function isEqualNode(?other : thx.xml.dom.Node) : Bool {
    if(!super.isEqualNode(other))
      return false;
    var otherDocumentFragment : DOMDocumentFragment = cast other;
    if(childNodes.length != otherDocumentFragment.childNodes.length)
      return false;
    for(i in 0...childNodes.length)
      if(!childNodes[i].isEqualNode(otherDocumentFragment.childNodes[i]))
        return false;
    return true;
  }
}
