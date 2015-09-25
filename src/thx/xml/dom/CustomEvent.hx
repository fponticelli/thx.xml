package thx.xml.dom;

import thx.xml.dom.Event;

interface CustomEvent extends Event {
  var detail(default, null) : Null<Dynamic>;
}

typedef CustomEventInit = {>EventInit,
  detail : Null<Dynamic>
}
