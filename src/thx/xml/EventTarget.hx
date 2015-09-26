package thx.xml;

import thx.xml.dom.Event;
import thx.xml.dom.DOMString;
import thx.xml.dom.EventTarget.EventListener;
using thx.Arrays;

@:access(thx.xml.Event)
class EventTarget implements thx.xml.dom.EventTarget {
  public function addEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void {
    if(null == callback || existsListener(type, callback, capture)) return;
    var list = ensureList(type);
    list.push({
      listener : callback,
      capture : null == capture ? false : capture
    });
  }

  public function removeEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void {
    var list = ensureList(type);
    list.extract(function(item) return item.listener.handleEvent == callback.handleEvent && item.capture == capture);
  }

  public function dispatchEvent(event : Event) : Bool {
    var event = cast(event, thx.xml.Event);
    if(event.dispatchFlag || !event.initializedFlag)
      throw DOMException.fromCode(INVALID_STATE_ERR);
    event.isTrusted = false;
    // dispatch event
    event.dispatchFlag = true;
    setTarget(event);
    var eventPath = getAncestors();
    event.eventPhase = CAPTURING_PHASE;
    for(eventTarget in eventPath) {
      if(event.stopPropagationFlag) break;
      eventTarget.invokeListeners(event);
    }
    event.eventPhase = AT_TARGET;
    if(!event.stopPropagationFlag) {
      invokeListeners(event);
    }
    if(event.bubbles && !event.stopPropagationFlag) {
      eventPath.reverse();
      event.eventPhase = BUBBLING_PHASE;
      for(eventTarget in eventPath) {
        if(event.stopPropagationFlag) break;
        eventTarget.invokeListeners(event);
      }
    }
    event.dispatchFlag = false;
    event.eventPhase = NONE;
    event.currentTarget = null;

    return !event.defaultPrevented;
  }

  var map : Map<String, Array<{ listener : EventListener, capture : Bool }>>;
  public function new() {
    map = new Map();
  }

  function existsListener(type : DOMString, ?callback : EventListener, ?capture : Null<Bool>) : Bool {
    var list = ensureList(type);
    var c : Bool = null == capture ? false : capture;
    return list.any(function(item) return item.listener.handleEvent == callback.handleEvent && item.capture == c);
  }

  function ensureList(type : DOMString) {
    var list = map.get(type);
    if(null == list) {
      list = [];
      map.set(type, list);
    }
    return list;
  }

  function setTarget(event : thx.xml.Event) {
    event.target = this;
  }

  // TODO for types with `parent`
  function getAncestors() : Array<EventTarget> {
    return [];
  }

  function invokeListeners(event : thx.xml.Event) {
    var list = map.get(event.type);
    if(null == list) return;
    for(item in list)
      item.listener.handleEvent(event);
  }
}
