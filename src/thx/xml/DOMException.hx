package thx.xml;

class DOMException extends thx.Error {
  public static function fromName(name : String, ?message : String, ?pos : haxe.PosInfos) {
    var code = DOMExceptionCode.fromName(name);
    return new DOMException(code, name, null == message ? code.getMessage() : message, pos);
  }

  public static function fromCode(code : DOMExceptionCode, ?name : String, ?message : String, ?pos : haxe.PosInfos)
    return new DOMException(code, null == name ? code.getName() : name, null == message ? code.getMessage() : message, pos);

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

@:enum
abstract DOMExceptionCode(Int) to Int from Int {
  public static function fromName(name : String)
    return switch name {
      case "IndexSizeError" : INDEX_SIZE_ERR;
      case "DOMSTRING_SIZE_ERR" : DOMSTRING_SIZE_ERR;
      case "HierarchyRequestError" : HIERARCHY_REQUEST_ERR;
      case "WrongDocumentError" : WRONG_DOCUMENT_ERR;
      case "InvalidCharacterError" : INVALID_CHARACTER_ERR;
      case "NO_DATA_ALLOWED_ERR" : NO_DATA_ALLOWED_ERR;
      case "NoModificationAllowedError" : NO_MODIFICATION_ALLOWED_ERR;
      case "NotFoundError" : NOT_FOUND_ERR;
      case "NotSupportedError" : NOT_SUPPORTED_ERR;
      case "INUSE_ATTRIBUTE_ERR" : INUSE_ATTRIBUTE_ERR;
      case "InvalidStateError" : INVALID_STATE_ERR;
      case "SyntaxError" : SYNTAX_ERR;
      case "InvalidModificationError" : INVALID_MODIFICATION_ERR;
      case "NamespaceError" : NAMESPACE_ERR;
      case "InvalidAccessError" : INVALID_ACCESS_ERR;
      case "VALIDATION_ERR" : VALIDATION_ERR;
      case "TYPE_MISMATCH_ERR" : TYPE_MISMATCH_ERR;
      case "SecurityError" : SECURITY_ERR;
      case "NetworkError" : NETWORK_ERR;
      case "AbortError" : ABORT_ERR;
      case "URLMismatchError" : URL_MISMATCH_ERR;
      case "QuotaExceededError" : QUOTA_EXCEEDED_ERR;
      case "TimeoutError" : TIMEOUT_ERR;
      case "InvalidNodeTypeError" : INVALID_NODE_TYPE_ERR;
      case "DataCloneError" : DATA_CLONE_ERR;
      case _: NOT_DEFINED;
    };

  public var NOT_DEFINED : DOMExceptionCode = 0;
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

  public function getMessage() : String
    return switch this {
      case INDEX_SIZE_ERR: "The index is not in the allowed range";
      case DOMSTRING_SIZE_ERR: "DOMSTRING_SIZE_ERR";
      case HIERARCHY_REQUEST_ERR: "The operation would yield an incorrect node tree";
      case WRONG_DOCUMENT_ERR: "The object is in the wrong document";
      case INVALID_CHARACTER_ERR: "The string contains invalid characters";
      case NO_DATA_ALLOWED_ERR: "NO_DATA_ALLOWED_ERR";
      case NO_MODIFICATION_ALLOWED_ERR: "The object can not be modified";
      case NOT_FOUND_ERR: "The object can not be found here";
      case NOT_SUPPORTED_ERR: "The operation is not supported";
      case INUSE_ATTRIBUTE_ERR: "INUSE_ATTRIBUTE_ERR";
      case INVALID_STATE_ERR: "The object is in an invalid state";
      case SYNTAX_ERR: "The string did not match the expected pattern";
      case INVALID_MODIFICATION_ERR: "The object can not be modified in this way";
      case NAMESPACE_ERR: "The operation is not allowed by Namespaces in XML";
      case INVALID_ACCESS_ERR: "The object does not support the operation or argument";
      case VALIDATION_ERR: "VALIDATION_ERR";
      case TYPE_MISMATCH_ERR: "TYPE_MISMATCH_ERR";
      case SECURITY_ERR: "The operation is insecure";
      case NETWORK_ERR: "A network error occurred";
      case ABORT_ERR: "The operation was aborted";
      case URL_MISMATCH_ERR: "The given URL does not match another URL";
      case QUOTA_EXCEEDED_ERR: "The quota has been exceeded";
      case TIMEOUT_ERR: "The operation timed out";
      case INVALID_NODE_TYPE_ERR: "The supplied node is incorrect or has an incorrect ancestor for this operation";
      case DATA_CLONE_ERR: "The object can not be cloned";
      case _: 'Unknown error code $this';
    };

  public function getName() : String
    return switch this {
      case INDEX_SIZE_ERR: "IndexSizeError";
      case DOMSTRING_SIZE_ERR: "DOMSTRING_SIZE_ERR";
      case HIERARCHY_REQUEST_ERR: "HierarchyRequestError";
      case WRONG_DOCUMENT_ERR: "WrongDocumentError";
      case INVALID_CHARACTER_ERR: "InvalidCharacterError";
      case NO_DATA_ALLOWED_ERR: "NO_DATA_ALLOWED_ERR";
      case NO_MODIFICATION_ALLOWED_ERR: "NoModificationAllowedError";
      case NOT_FOUND_ERR: "NotFoundError";
      case NOT_SUPPORTED_ERR: "NotSupportedError";
      case INUSE_ATTRIBUTE_ERR: "INUSE_ATTRIBUTE_ERR";
      case INVALID_STATE_ERR: "InvalidStateError";
      case SYNTAX_ERR: "SyntaxError";
      case INVALID_MODIFICATION_ERR: "InvalidModificationError";
      case NAMESPACE_ERR: "NamespaceError";
      case INVALID_ACCESS_ERR: "InvalidAccessError";
      case VALIDATION_ERR: "VALIDATION_ERR";
      case TYPE_MISMATCH_ERR: "TYPE_MISMATCH_ERR";
      case SECURITY_ERR: "SecurityError";
      case NETWORK_ERR: "NetworkError";
      case ABORT_ERR: "AbortError";
      case URL_MISMATCH_ERR: "URLMismatchError";
      case QUOTA_EXCEEDED_ERR: "QuotaExceededError";
      case TIMEOUT_ERR: "TimeoutError";
      case INVALID_NODE_TYPE_ERR: "InvalidNodeTypeError";
      case DATA_CLONE_ERR: "DataCloneError";
      case _: 'Unknown error code $this';
    };
}
