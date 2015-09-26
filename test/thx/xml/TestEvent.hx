package thx.xml;

import utest.Assert;
import thx.xml.CustomEvent;
import thx.xml.Event;
import thx.xml.EventTarget;

class TestEvent {
  public function new() {}

  public function testConstructor() {
    var event = new Event("click");
    Assert.equals("click", event.type);
    Assert.isFalse(event.bubbles);
    Assert.isFalse(event.cancelable);
  }

  public function testEventTargetAddListener() {
    var target = new TestEventTarget(),
        clicked = false;
    target.addEventListener("click", function(_) clicked = !clicked);
    target.fireEvent("click");
    Assert.isTrue(clicked);
  }

  public function testEventTargetRemoveListenerWithF() {
    var target = new TestEventTarget(),
        clicked = false,
        f = function(_) clicked = !clicked;
    target.addEventListener("click", f);
    target.fireEvent("click");
    Assert.isTrue(clicked);
    target.removeEventListener("click", f);
    target.fireEvent("click");
    Assert.isFalse(clicked);
  }

  public function testEventTargetRemoveListenerWithObject() {
    var target = new TestEventTarget(),
        clicked = false,
        o = { handleEvent : function(_) clicked = !clicked };
    target.addEventListener("click", o);
    target.fireEvent("click");
    Assert.isTrue(clicked);
    target.removeEventListener("click", o);
    target.fireEvent("click");
    Assert.isFalse(clicked);
  }

  // TODO test bubbling
  // TODO test currentTarget
  // TODO test target
  // TODO test eventPhase
  // TODO test Timestamp
  // TODO test bubbles field
  // TODO test cancelable field
  // TODO test defaultPrevented
  // TODO test isTrusted

  // TODO test capturing
  // TODO test currentTarget
  // TODO test target
  // TODO test eventPhase
  // TODO test Timestamp
  // TODO test bubbles field
  // TODO test cancelable field
  // TODO test defaultPrevented
  // TODO test isTrusted
}

class TestEventTarget extends EventTarget {
  public function new() super();
}
