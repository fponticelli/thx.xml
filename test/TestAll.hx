import utest.UTest;

class TestAll {
  public static function main() {
    UTest.run([
        new thx.xml.TestDOMException(),
        new thx.xml.TestEvent()
      ]);
  }
}