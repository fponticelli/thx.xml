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

abstract EventInit(EventInitImpl) from EventInitImpl {
  public static function ensure(?init : EventInit) : EventInit
    return null == init ? {} : init;

  public var bubbles(get, set) : Bool;
  public var cancelable(get, set) : Bool;

  inline function get_bubbles() return null == this.bubbles ? false : this.bubbles;
  inline function set_bubbles(v : Null<Bool>) return this.bubbles = v;
  inline function get_cancelable() return null == this.cancelable ? false : this.cancelable;
  inline function set_cancelable(v : Null<Bool>) return this.cancelable = v;
}

typedef EventInitImpl = {
  ?bubbles : Bool, // false
  ?cancelable : Bool // false
}
