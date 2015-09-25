package thx.xml.dom;

interface CharacterData
  extends NonDocumentTypeChildNode
  extends ChildNode
  extends Node {
    // [TreatNullAs=EmptyString] attribute DOMString data;
    // readonly attribute unsigned long length;
    // DOMString substringData(unsigned long offset, unsigned long count);
    // void appendData(DOMString data);
    // void insertData(unsigned long offset, DOMString data);
    // void deleteData(unsigned long offset, unsigned long count);
    // void replaceData(unsigned long offset, unsigned long count, DOMString data);
}
