package thx.xml;

import thx.xml.Event;

class CustomEvent extends Event {
  public var detail(default, null) : Dynamic;

  public function new(type : DOMString, ?eventInitDict : CustomEventInit) {
    eventInitDict = CustomEventInit.ensure(eventInitDict);
    super(type, eventInitDict.toObject());
    this.detail = eventInitDict.detail;
  }
}

abstract CustomEventInit(CustomEventInitImpl) from CustomEventInitImpl {
  public static function ensure(?init : CustomEventInit) : CustomEventInit
    return null == init ? {} : init;

  public var bubbles(get, set) : Bool;
  public var cancelable(get, set) : Bool;
  public var detail(get, set) : Null<Dynamic>;

  inline function get_bubbles() return null == this.bubbles ? false : this.bubbles;
  inline function set_bubbles(v : Null<Bool>) return this.bubbles = v;
  inline function get_cancelable() return null == this.cancelable ? false : this.cancelable;
  inline function set_cancelable(v : Null<Bool>) return this.cancelable = v;
  inline function get_detail() return null == this.detail ? false : this.detail;
  inline function set_detail(v : Null<Dynamic>) return this.detail = v;

  inline public function toObject() : CustomEventInitImpl
    return this;
}

typedef CustomEventInitImpl = {>EventInitImpl,
  ?detail : Null<Dynamic>
}
