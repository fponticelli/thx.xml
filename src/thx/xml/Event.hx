package thx.xml;

class Event {
  public var type(default, null) : DOMString;
  public var target(default, null) : EventTarget;
  public var currentTarget(default, null) : EventTarget;
  public var eventPhase(default, null) : EventPhase;

  var stopPropagationFlag : Bool;
  var stopImmediatePropagationFlag : Bool;
  var initializedFlag : Bool;
  var dispatchFlag : Bool;

  public function stopPropagation() : Void
    stopPropagationFlag = true;

  public function stopImmediatePropagation() : Void {
    stopPropagationFlag = true;
    stopImmediatePropagationFlag = true;
  }

  public var bubbles(default, null) : Bool;
  public var cancelable(default, null) : Bool;

  public function preventDefault() : Void
    if(cancelable)
      defaultPrevented = true;

  public var defaultPrevented(default, null) : Bool;

  // [Unforgeable]
  public var isTrusted(default, null) : Bool;
  public var timeStamp(default, null) : DOMTimeStamp;

  // As events have constructors initEvent() is superfluous. However, it has to be supported for legacy content.
  public function initEvent(type : DOMString, bubbles : Bool, cancelable : Bool) : Void {
    initializedFlag = true;
    if(dispatchFlag) return;
    stopPropagationFlag = false;
    stopImmediatePropagationFlag = false;
    defaultPrevented = false;
    isTrusted = false;
    target = null;
    this.type = null == type ? "" : type;
    this.bubbles = bubbles;
    this.cancelable = cancelable;
  }

  public function new(type : DOMString, ?eventInitDict : EventInit) {
    eventInitDict = EventInit.ensure(eventInitDict);
    this.type = null == type ? "" : type;
    this.bubbles = eventInitDict.bubbles;
    this.cancelable = eventInitDict.cancelable;
    this.timeStamp = thx.Timestamp.now();

    this.target = null;
    this.currentTarget = null;
    this.eventPhase = NONE;

    this.stopPropagationFlag = false;
    this.stopImmediatePropagationFlag = false;
    this.defaultPrevented = false;
    this.initializedFlag = true;
    this.dispatchFlag = false;

    this.isTrusted = false;
  }
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
