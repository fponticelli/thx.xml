package thx.xml;

import utest.Assert;
import thx.xml.DOMException;

class TestDOMException {
  public function new() {}

  public function testException() {
    Assert.equals("SyntaxError", DOMException.fromName("SyntaxError").name);
    Assert.equals(12, DOMException.fromName("SyntaxError").code);
    Assert.equals("The string did not match the expected pattern", DOMException.fromName("SyntaxError").message);

    Assert.equals("SyntaxError", DOMException.fromCode(12).name);
    Assert.equals(12, DOMException.fromCode(12).code);
    Assert.equals("The string did not match the expected pattern", DOMException.fromCode(12).message);
  }
}
