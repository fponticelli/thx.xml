package thx.xml;

class Range {
  public var startContainer(default, null) : Node;
  public var startOffset(default, null) : Int;
  public var endContainer(default, null) : Node;
  public var endOffset(default, null) : Int;
  public var collapsed(default, null) : Bool;
  public var commonAncestorContainer(default, null) : Node;

  public function setStart(node : Node, offset : Int) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function setEnd(node : Node, offset : Int) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function setStartBefore(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function setStartAfter(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function setEndBefore(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function setEndAfter(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function collapse(?toStart : Bool = false) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function selectNode(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function selectNodeContents(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }

  public function compareBoundaryPoints(how : RangeHow, sourceRange : Range) : Int {
    return throw new thx.error.NotImplemented();
  }

  public function deleteContents() : Void {
    return throw new thx.error.NotImplemented();
  }
  public function extractContents() : DocumentFragment {
    return throw new thx.error.NotImplemented();
  }
  public function cloneContents() : DocumentFragment {
    return throw new thx.error.NotImplemented();
  }
  public function insertNode(node : Node) : Void {
    return throw new thx.error.NotImplemented();
  }
  public function surroundContents(newParent : Node) : Void {
    return throw new thx.error.NotImplemented();
  }

  public function cloneRange() : Range {
    return throw new thx.error.NotImplemented();
  }
  public function detach() : Void {
    return throw new thx.error.NotImplemented();
  }

  public function isPointInRange(node : Node, offset : Int) : Bool {
    return throw new thx.error.NotImplemented();
  }
  public function comparePoint(node : Node, offset : Int) : Int {
    return throw new thx.error.NotImplemented();
  }

  public function intersectsNode(node : Node) : Bool {
    return throw new thx.error.NotImplemented();
  }

  // stringifier;
}

@:enum
abstract RangeHow(Int) to Int {
  public var START_TO_START : RangeHow = 0;
  public var START_TO_END : RangeHow = 1;
  public var END_TO_END : RangeHow = 2;
  public var END_TO_START : RangeHow = 3;
}
