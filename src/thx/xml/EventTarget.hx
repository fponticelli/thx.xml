package thx.xml;

using thx.Arrays;

@:access(thx.xml.Event)
class EventTarget {
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
    setEventTarget(event);
    var eventPath = getAncestors();
    event.eventPhase = CAPTURING_PHASE;
    for(eventTarget in eventPath) {
      if(event.stopPropagationFlag)
        break;
      eventTarget.invoke(event);
    }
    event.eventPhase = AT_TARGET;
    if(!event.stopPropagationFlag) {
      invoke(event);
    }
    if(event.bubbles && !event.stopPropagationFlag) {
      eventPath.reverse();
      event.eventPhase = BUBBLING_PHASE;
      for(eventTarget in eventPath) {
        if(event.stopPropagationFlag)
          break;
        eventTarget.invoke(event);
      }
    }
    event.dispatchFlag = false;
    event.eventPhase = NONE;
    event.currentTarget = null;

    return !event.defaultPrevented;
  }

  var map : Map<String, Array<{ listener : EventListener, capture : Bool }>>;
  function new() {
    map = new Map();
  }

  // NON-STANDARD
  public function fireEvent(type : DOMString, ?bubbles = false, ?cancelable = false) {
    var event = new thx.xml.Event(type, { bubbles : bubbles, cancelable : cancelable });
    dispatchEvent(event);
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

  function setEventTarget(event : thx.xml.Event) {
    // TODO setEventTarget,  add override
    event.target = this;
  }

  // TODO getAncestors, for types with `parent`
  function getAncestors() : Array<EventTarget> {
    return [];
  }

  function invoke(event : thx.xml.Event) {
    var list = map.get(event.type);
    if(null == list) return;
    list = list.copy(); // should play nice with altering the original chain of listeners
    event.currentTarget = this;
    for(item in list) {
      if(event.stopImmediatePropagationFlag)
        break;
      if(event.eventPhase == CAPTURING_PHASE && !item.capture ||
         event.eventPhase == BUBBLING_PHASE && item.capture)
        continue;
      // Call listener's callback's handleEvent, with the event passed to this algorithm as the first argument and event's currentTarget attribute value as callback this value.
      // TODO invoke, not sure how this works out in Haxe, possibly do nothing about it
      item.listener.handleEvent(event);
    }
  }
}

@:forward(handleEvent)
abstract EventListener(EventListenerImpl) from EventListenerImpl to EventListenerImpl {
  @:from inline public static function fromFunction(f : Event -> Void) : EventListener
    return { handleEvent : f };
}

typedef EventListenerImpl = { handleEvent : Event -> Void };
