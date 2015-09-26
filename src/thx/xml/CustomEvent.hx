package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.CustomEvent.CustomEventInit;

class CustomEvent extends Event implements thx.xml.dom.CustomEvent {
  public var detail(default, null) : Dynamic;

  public function new(type : DOMString, ?eventInitDict : CustomEventInit) {
    eventInitDict = CustomEventInit.ensure(eventInitDict);
    super(type, eventInitDict.toObject());
    this.detail = eventInitDict.detail;
  }
}
