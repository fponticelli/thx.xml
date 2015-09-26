package thx.xml.dom;

interface EventTarget {
  function addEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void;
  function removeEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void;
  function dispatchEvent(event : Event) : Bool;
}

@:forward(handleEvent)
abstract EventListener(EventListenerImpl) from EventListenerImpl to EventListenerImpl {
  @:from inline public static function fromFunction(f : Event -> Void) {
    return {
      handleEvent : f
    };
  }
}

typedef EventListenerImpl = { handleEvent : Event -> Void };
