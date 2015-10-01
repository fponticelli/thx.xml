package thx.xml;

interface NodeFilter {
  function acceptNode(node : Node) : NodeFilterAccept;
}

@:enum
abstract NodeFilterAccept(Int) to Int {
  public var FILTER_ACCEPT : NodeFilterAccept = 1;
  public var FILTER_REJECT : NodeFilterAccept = 2;
  public var FILTER_SKIP : NodeFilterAccept = 3;
}

@:enum
abstract WhatToShow(Int) to Int {
  public var SHOW_ALL : WhatToShow = 0xFFFFFFFF;
  public var SHOW_ELEMENT : WhatToShow = 0x1;
  public var SHOW_ATTRIBUTE : WhatToShow = 0x2; // historical
  public var SHOW_TEXT : WhatToShow = 0x4;
  public var SHOW_CDATA_SECTION : WhatToShow = 0x8; // historical
  public var SHOW_ENTITY_REFERENCE : WhatToShow = 0x10; // historical
  public var SHOW_ENTITY : WhatToShow = 0x20; // historical
  public var SHOW_PROCESSING_INSTRUCTION : WhatToShow = 0x40;
  public var SHOW_COMMENT : WhatToShow = 0x80;
  public var SHOW_DOCUMENT : WhatToShow = 0x100;
  public var SHOW_DOCUMENT_TYPE : WhatToShow = 0x200;
  public var SHOW_DOCUMENT_FRAGMENT : WhatToShow = 0x400;
  public var SHOW_NOTATION : WhatToShow = 0x800; // historical
}
