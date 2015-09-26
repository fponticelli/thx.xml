package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.DocumentFragment as DOMDocumentFragment;
import thx.xml.dom.Element as DOMElement;
import thx.xml.dom.HTMLCollection as DOMHTMLCollection;
import thx.xml.dom.NodeList as DOMNodeList;

class DocumentFragment extends Node implements DOMDocumentFragment {
  public function getElementById(id : String) : Null<DOMElement> {
    return throw "not implemented";
  }

  public var children(default, null) : DOMHTMLCollection;
  public var firstElementChild(default, null) : Null<DOMElement>;
  public var lastElementChild(default, null) : Null<DOMElement>;
  public var childElementCount(default, null) : Int;

  public function querySelector(selectors : DOMString) : Null<DOMElement> {
    return throw "not implemented";
  }
  public function querySelectorAll(selectors : DOMString) : DOMNodeList {
    return throw "not implemented";
  }
}
