package thx.xml.dom;

// [Constructor(MutationCallback callback)]
interface MutationObserver {
  function observe(target : Node, options : MutationObserverInit) : Void;
  function disconnect() : Void;
  // sequence<MutationRecord>
  function takeRecords() : Array<MutationRecord>;
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
