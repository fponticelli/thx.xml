package thx.xml.dom;

interface DOMException {
  public var code : DOMExceptionCode;
}

@:enum
abstract DOMExceptionCode(Int) to Int {
  public var INDEX_SIZE_ERR : DOMExceptionCode = 1;
  public var DOMSTRING_SIZE_ERR : DOMExceptionCode = 2; // historical
  public var HIERARCHY_REQUEST_ERR : DOMExceptionCode = 3;
  public var WRONG_DOCUMENT_ERR : DOMExceptionCode = 4;
  public var INVALID_CHARACTER_ERR : DOMExceptionCode = 5;
  public var NO_DATA_ALLOWED_ERR : DOMExceptionCode = 6; // historical
  public var NO_MODIFICATION_ALLOWED_ERR : DOMExceptionCode = 7;
  public var NOT_FOUND_ERR : DOMExceptionCode = 8;
  public var NOT_SUPPORTED_ERR : DOMExceptionCode = 9;
  public var INUSE_ATTRIBUTE_ERR : DOMExceptionCode = 10; // historical
  public var INVALID_STATE_ERR : DOMExceptionCode = 11;
  public var SYNTAX_ERR : DOMExceptionCode = 12;
  public var INVALID_MODIFICATION_ERR : DOMExceptionCode = 13;
  public var NAMESPACE_ERR : DOMExceptionCode = 14;
  public var INVALID_ACCESS_ERR : DOMExceptionCode = 15;
  public var VALIDATION_ERR : DOMExceptionCode = 16; // historical
  public var TYPE_MISMATCH_ERR : DOMExceptionCode = 17; // historical; use JavaScript's TypeError instead
  public var SECURITY_ERR : DOMExceptionCode = 18;
  public var NETWORK_ERR : DOMExceptionCode = 19;
  public var ABORT_ERR : DOMExceptionCode = 20;
  public var URL_MISMATCH_ERR : DOMExceptionCode = 21;
  public var QUOTA_EXCEEDED_ERR : DOMExceptionCode = 22;
  public var TIMEOUT_ERR : DOMExceptionCode = 23;
  public var INVALID_NODE_TYPE_ERR : DOMExceptionCode = 24;
  public var DATA_CLONE_ERR : DOMExceptionCode = 25;
}
