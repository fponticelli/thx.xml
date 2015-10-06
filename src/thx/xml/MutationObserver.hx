package thx.xml;

// [Constructor(MutationCallback callback)]
class MutationObserver {
  public function observe(target : Node, options : MutationObserverInit) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function disconnect() : Void {
    return throw new thx.error.NotImplemented();
  }
  // sequence<MutationRecord>
  public function takeRecords() : Array<MutationRecord> {
    return throw new thx.error.NotImplemented();
  }
}

typedef MutationCallback = Array<MutationRecord> -> MutationObserver -> Void;

typedef MutationObserverInit = {
  childList : Bool, // false
  attributes : Bool,
  characterData : Bool,
  subtree : Bool, // false
  attributeOldValue : Bool,
  characterDataOldValue : Bool,
  //sequence<DOMString>
  attributeFilter : Array<DOMString>
}
