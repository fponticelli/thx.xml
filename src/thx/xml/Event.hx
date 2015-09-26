package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.DOMTimeStamp;
import thx.xml.dom.EventTarget;
import thx.xml.dom.Event.EventPhase;
import thx.xml.dom.Event.EventInit;

class Event implements thx.xml.dom.Event {
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
    this.initializedFlag = false;
    this.dispatchFlag = false;

    this.isTrusted = false;
  }
}
