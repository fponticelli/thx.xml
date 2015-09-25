package thx.xml;

import utest.Assert;
import thx.xml.Event;

class TestEvent {
  public function new() {}

  public function testConstructor() {
    var event = new Event("click");
    Assert.equals("click", event.type);
    Assert.isFalse(event.bubbles);
    Assert.isFalse(event.cancelable);
  }
}
