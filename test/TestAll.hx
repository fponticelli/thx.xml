import utest.UTest;

class TestAll {
  public static function main() {
    UTest.run([
        new thx.xml.TestDOMException(),
        new thx.xml.TestEvent(),
        new thx.xml.TestHaxeNativeXML(),
        new thx.xml.TestNode(),
        new thx.xml.TestXMLWriter()
      ]);
  }
}
