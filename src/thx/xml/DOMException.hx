package thx.xml;

import thx.xml.dom.DOMString;
import thx.xml.dom.DOMException.DOMExceptionCode;

class DOMException extends thx.Error implements thx.xml.dom.DOMException {
  public static function fromName(name : String, ?message : String) {
    var code = DOMExceptionCode.fromName(name);
    return new DOMException(code, name, null == message ? code.getMessage() : message);
  }

  public static function fromCode(code : DOMExceptionCode, ?name : String, ?message : String)
    return new DOMException(code, null == name ? code.getName() : name, null == message ? code.getMessage() : message);

#if !js
  public var name : DOMString;
#end
  public var code : DOMExceptionCode;
  public function new(code : DOMExceptionCode, name : String, message : String, ?pos : haxe.PosInfos) {
    this.code = code;
    this.name = name;
    super(message, pos);
  }
}
