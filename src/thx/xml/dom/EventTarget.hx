package thx.xml.dom;

interface EventTarget {
  function addEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void;
  function removeEventListener(type : DOMString, ?callback : EventListener, ?capture : Bool) : Void;
  function dispatchEvent(event : Event) : Void;
}

typedef EventListener = Event -> Void;
