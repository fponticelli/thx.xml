package thx.xml;

class DOMTokenList {
  public var length(default, null) : Int;
  public function item(index : Int) : Null<DOMString>  {
    return throw new thx.error.NotImplemented();
  }
  public function contains(token : DOMString) : Bool  {
    return throw new thx.error.NotImplemented();
  }
  //function add(DOMString... tokens) : Void;
  public function add(token : DOMString) : Void  {
    return throw new thx.error.NotImplemented();
  }
  //function remove(DOMString... tokens) : Void;
  public function remove(token : DOMString) : Void  {
    return throw new thx.error.NotImplemented();
  }
  public function toggle(token : DOMString, ?force : Bool) : Bool  {
    return throw new thx.error.NotImplemented();
  }
  // stringifier;
}
