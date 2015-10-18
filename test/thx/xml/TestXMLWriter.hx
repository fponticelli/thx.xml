package thx.xml;

import thx.xml.*;
import utest.Assert;
using thx.Strings;
using thx.xml.Document;

@:resolve("&")
@:file("test/thx/xml/resources.json")
class TestXMLWriter implements thx.StaticResource {
  var doc : Document;
  public function new() {}

  public function setup() {
    doc = new Document();
  }

  public function testElementToString() {
    var el = doc.createElement("a");
    el.className = "custom-class";
    el.setAttribute("href", "http://google.com/");
    el.setAttribute("target", "_blank");
    var text = doc.createTextNode("link it good");
    el.appendChild(text);
    Assert.equals('<a class="custom-class" href="http://google.com/" target="_blank">link it good</a>', el.toString());
  }

  public function testSample() {
    var native = Xml.parse(TestXMLWriter.sample);
    Assert.equals(TestXMLWriter.sample, native.toString().replace("&#039;", "'"));
    var doc = native.toDom4();
    Assert.equals(TestXMLWriter.sample, doc.toString());
  }

  // TODO encode entities in attributes
}
