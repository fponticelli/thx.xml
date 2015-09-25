package thx.xml.dom;

interface DOMTokenList {
  var length(default, null) : Int;
  function item(index : Int) : Null<DOMString>;
  function contains(token : DOMString) : Bool;
  //function add(DOMString... tokens) : Void;
  function add(token : DOMString) : Void;
  //function remove(DOMString... tokens) : Void;
  function remove(token : DOMString) : Void;
  function toggle(token : DOMString, ?force : Bool) : Bool;
  // stringifier;
}
