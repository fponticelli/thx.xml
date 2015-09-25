package thx.xml.dom;

interface Range {
  var startContainer(default, null) : Node;
  var startOffset(default, null) : Int;
  var endContainer(default, null) : Node;
  var endOffset(default, null) : Int;
  var collapsed(default, null) : Bool;
  var commonAncestorContainer(default, null) : Node;

  function setStart(node : Node, offset : Int) : Void;
  function setEnd(node : Node, offset : Int) : Void;
  function setStartBefore(node : Node) : Void;
  function setStartAfter(node : Node) : Void;
  function setEndBefore(node : Node) : Void;
  function setEndAfter(node : Node) : Void;
  function collapse(?toStart : Bool = false) : Void;
  function selectNode(node : Node) : Void;
  function selectNodeContents(node : Node) : Void;

  function compareBoundaryPoints(how : RangeHow, sourceRange : Range) : Int;

  function deleteContents() : Void;
  function extractContents() : DocumentFragment;
  function cloneContents() : DocumentFragment;
  function insertNode(node : Node) : Void;
  function surroundContents(newParent : Node) : Void;

  function cloneRange() : Range;
  function detach() : Void;

  function isPointInRange(node : Node, offset : Int) : Bool;
  function comparePoint(node : Node, offset : Int) : Int;

  function intersectsNode(node : Node) : Bool;

  // stringifier;
}

@:enum
abstract RangeHow(Int) to Int {
  public var START_TO_START : RangeHow = 0;
  public var START_TO_END : RangeHow = 1;
  public var END_TO_END : RangeHow = 2;
  public var END_TO_START : RangeHow = 3;
}
