package thx.xml.dom;

interface Element
  extends ParentNode
  extends NonDocumentTypeChildNode
  extends ChildNode {
    // readonly attribute DOMString? namespaceURI;
    // readonly attribute DOMString? prefix;
    // readonly attribute DOMString localName;
    // readonly attribute DOMString tagName;
    //
    //          attribute DOMString id;
    //          attribute DOMString className;
    // [SameObject] readonly attribute DOMTokenList classList;
    //
    // [SameObject] readonly attribute Attr[] attributes;
    // DOMString? getAttribute(DOMString name);
    // DOMString? getAttributeNS(DOMString? namespace, DOMString localName);
    // void setAttribute(DOMString name, DOMString value);
    // void setAttributeNS(DOMString? namespace, DOMString name, DOMString value);
    // void removeAttribute(DOMString name);
    // void removeAttributeNS(DOMString? namespace, DOMString localName);
    // boolean hasAttribute(DOMString name);
    // boolean hasAttributeNS(DOMString? namespace, DOMString localName);
    //
    //
    // HTMLCollection getElementsByTagName(DOMString localName);
    // HTMLCollection getElementsByTagNameNS(DOMString? namespace, DOMString localName);
    // HTMLCollection getElementsByClassName(DOMString classNames);
}
