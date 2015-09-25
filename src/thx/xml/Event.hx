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

  public function stopPropagation() : Void {

  }
  public function stopImmediatePropagation() : Void {

  }

  public var bubbles(default, null) : Bool;
  public var cancelable(default, null) : Bool;

  public function preventDefault() : Void {

  }

  public var defaultPrevented(default, null) : Bool;

  // [Unforgeable]
  public var isTrusted(default, null) : Bool;
  public var timeStamp(default, null) : DOMTimeStamp;

  // TODO constructor?
  public function initEvent(type : DOMString, bubbles : Bool, cancelable : Bool) : Void {

  }

  public function new(type : DOMString, ?eventInitDict : EventInit) {
    eventInitDict = EventInit.ensure(eventInitDict);
    this.type = type;
    this.bubbles = eventInitDict.bubbles;
    this.cancelable = eventInitDict.cancelable;
    this.timeStamp = thx.Timestamp.now();
  }
}
