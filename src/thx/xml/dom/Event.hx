package thx.xml.dom;

interface Event {
  var type(default, null) : DOMString;
  var target(default, null) : EventTarget;
  var currentTarget(default, null) : EventTarget;
  var eventPhase(default, null) : EventPhase;

  function stopPropagation() : Void;
  function stopImmediatePropagation() : Void;

  var bubbles(default, null) : Bool;
  var cancelable(default, null) : Bool;

  function preventDefault() : Void;

  var defaultPrevented(default, null) : Bool;

  // [Unforgeable]
  var isTrusted(default, null) : Bool;
  var timeStamp(default, null) : DOMTimeStamp;

  // TODO constructor?
  function initEvent(type : DOMString, bubbles : Bool, cancelable : Bool) : Void;
}

@:enum
abstract EventPhase(Int) to Int {
  var NONE = 0;
  var CAPTURING_PHASE = 1;
  var AT_TARGET = 2;
  var BUBBLING_PHASE = 3;
}

typedef EventInit = {
  bubbles : Bool,
  cancelable : Bool
}
