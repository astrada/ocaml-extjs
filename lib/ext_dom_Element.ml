class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dom_AbstractElement.t
  
  method autoBoxAdjust : bool Js.t Js.prop
  method originalDisplay : Js.js_string Js.t Js.prop
  method addClsOnClick : Js.js_string Js.t -> 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> 'self Js.t Js.meth
  method addClsOnFocus : Js.js_string Js.t -> 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> 'self Js.t Js.meth
  method addClsOnOver : Js.js_string Js.t -> 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> 'self Js.t Js.meth
  method addKeyListener : 'a Js.t -> 'b Js.callback -> 'c Js.t Js.optdef ->
    Ext_util_KeyMap.t Js.t Js.meth
  method addKeyMap : 'a Js.t -> Ext_util_KeyMap.t Js.t Js.meth
  method addListener : Js.js_string Js.t -> 'a Js.callback ->
    'b Js.t Js.optdef -> 'c Js.t Js.optdef -> 'self Js.t Js.meth
  method alignTo : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'self Js.t Js.meth
  method anchorTo : 'a Js.t -> Js.js_string Js.t ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'c Js.t Js.optdef -> 'd Js.callback Js.optdef -> 'self Js.t Js.meth
  method animate : 'a Js.t -> 'self Js.t Js.meth
  method blur : 'self Js.t Js.meth
  method boxWrap : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method cacheScrollValues : 'a Js.callback Js.meth
  method center : 'a Js.t Js.optdef -> unit Js.meth
  method clean : bool Js.t Js.optdef -> unit Js.meth
  method clearListeners : 'self Js.t Js.meth
  method clearOpacity : 'self Js.t Js.meth
  method clearPositioning : Js.js_string Js.t Js.optdef ->
    #Ext_dom_AbstractElement.t Js.t Js.meth
  method clip : 'self Js.t Js.meth
  method createProxy : 'a Js.t -> 'b Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  method createShim : 'self Js.t Js.meth
  method enableDisplayMode : Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method fadeIn : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method fadeOut : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method focus : Js.number Js.t Js.optdef -> 'self Js.t Js.meth
  method focusable : bool Js.t Js.meth
  method frame : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    'a Js.t Js.optdef -> 'self Js.t Js.meth
  method getAlignToXY_2 : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  method getAnchorXY_2 : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef
    -> 'a Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t Js.meth
  method getAttributeNS : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.meth
  method getCenterXY : Js.number Js.t Js.js_array Js.t Js.meth
  method getColor : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  method getComputedHeight : Js.number Js.t Js.meth
  method getComputedWidth : Js.number Js.t Js.meth
  method getConstrainVector : 'a Js.t -> Js.number Js.t Js.js_array Js.t ->
    'b Js.t Js.meth
  method getFrameWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getLoader : Ext_ElementLoader.t Js.t Js.meth
  method getLocalX : Js.number Js.t Js.meth
  method getLocalY : Js.number Js.t Js.meth
  method getOffsetsTo_2 : 'a Js.t -> Js.number Js.t Js.js_array Js.t Js.meth
  method getPositioning : 'a Js.t Js.meth
  method getRegion : Ext_util_Region.t Js.t Js.meth
  method getScopeParent : Dom_html.element Js.t Js.meth
  method getScroll : 'a Js.t Js.meth
  method getStyleSize : 'a Js.t Js.meth
  method getTextWidth : Js.js_string Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  method getViewRegion : Ext_util_Region.t Js.t Js.meth
  method getXY_2 : Js.number Js.t Js.js_array Js.t Js.meth
  method ghost : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef ->
    'self Js.t Js.meth
  method hide : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method highlight : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef ->
    'self Js.t Js.meth
  method hover : 'a Js.callback -> 'b Js.callback -> 'c Js.t Js.optdef ->
    'd Js.t Js.optdef -> 'self Js.t Js.meth
  method initDD : Js.js_string Js.t -> 'a Js.t -> 'b Js.t -> Ext_dd_DD.t Js.t
    Js.meth
  method initDDProxy : Js.js_string Js.t -> 'a Js.t -> 'b Js.t ->
    Ext_dd_DDProxy.t Js.t Js.meth
  method initDDTarget : Js.js_string Js.t -> 'a Js.t -> 'b Js.t ->
    Ext_dd_DDTarget.t Js.t Js.meth
  method isBorderBox : bool Js.t Js.meth
  method isDisplayed : bool Js.t Js.meth
  method isMasked : bool Js.t Js.meth
  method isScrollable : bool Js.t Js.meth
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  method load : 'a Js.t -> 'self Js.t Js.meth
  method mask_2 : Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef
    -> 'self Js.t Js.meth
  method monitorMouseLeave : Js.number Js.t -> 'a Js.callback ->
    'b Js.t Js.optdef -> 'c Js.t Js.meth
  method move : Js.js_string Js.t -> Js.number Js.t -> 'a Js.t Js.optdef ->
    unit Js.meth
  method moveTo : Js.number Js.t -> Js.number Js.t -> 'a Js.t Js.optdef ->
    #Ext_dom_AbstractElement.t Js.t Js.meth
  method needsTabIndex : unit Js.meth
  method on : Js.js_string Js.t -> 'a Js.callback -> 'b Js.t Js.optdef ->
    'c Js.t Js.optdef -> 'self Js.t Js.meth
  method position : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> unit Js.meth
  method puff : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method purgeAllListeners : 'self Js.t Js.meth
  method relayEvent : Js.js_string Js.t -> 'a Js.t -> unit Js.meth
  method removeAllListeners : 'self Js.t Js.meth
  method removeAnchor : 'self Js.t Js.meth
  method removeListener : Js.js_string Js.t -> 'a Js.callback -> 'b Js.t ->
    'self Js.t Js.meth
  method scroll : Js.js_string Js.t -> Js.number Js.t -> 'a Js.t Js.optdef ->
    bool Js.t Js.meth
  method scrollBy : 'a Js.t -> 'b Js.t -> 'c Js.t -> 'self Js.t Js.meth
  method scrollIntoView : 'a Js.t Js.optdef -> bool Js.t Js.optdef ->
    'b Js.t Js.optdef -> 'self Js.t Js.meth
  method scrollTo : Js.js_string Js.t -> Js.number Js.t -> 'a Js.t Js.optdef
    -> 'self Js.t Js.meth
  method selectable : 'self Js.t Js.meth
  method setBounds : Js.number Js.t -> Js.number Js.t -> 'a Js.t -> 'b Js.t
    -> 'c Js.t Js.optdef -> #Ext_dom_AbstractElement.t Js.t Js.meth
  method setDisplayed : 'a Js.t -> 'self Js.t Js.meth
  method setLeftTop : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  method setLocation : Js.number Js.t -> Js.number Js.t -> 'a Js.t Js.optdef
    -> #Ext_dom_AbstractElement.t Js.t Js.meth
  method setOpacity : Js.number Js.t -> 'a Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setPositioning : 'a Js.t -> #Ext_dom_AbstractElement.t Js.t Js.meth
  method setRegion : Ext_util_Region.t Js.t -> 'a Js.t Js.optdef ->
    #Ext_dom_AbstractElement.t Js.t Js.meth
  method setVisible : bool Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method setXY_2 : Js.number Js.t Js.js_array Js.t -> 'a Js.t Js.optdef ->
    'self Js.t Js.meth
  method show : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method slideIn : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef ->
    'self Js.t Js.meth
  method slideOut : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef ->
    'self Js.t Js.meth
  method swallowEvent : 'a Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method switchOff : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method toggle : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method un : Js.js_string Js.t -> 'a Js.callback -> 'b Js.t -> 'self Js.t
    Js.meth
  method unclip : 'self Js.t Js.meth
  method unmask : unit Js.meth
  method unselectable : 'self Js.t Js.meth
  method update_2 : Js.js_string Js.t -> bool Js.t Js.optdef ->
    'a Js.callback Js.optdef -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dom_AbstractElement.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dom_AbstractElement.events
  
  method dOMActivate : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMAttrModified : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMCharacterDataModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMFocusIn : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMFocusOut : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMNodeInserted : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMNodeInsertedIntoDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMNodeRemoved : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMNodeRemovedFromDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dOMSubtreeModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method abort : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method blur : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method change : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method click : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method contextmenu : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method dblclick : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method error : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method focus : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method keydown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method keypress : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method keyup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method load : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method mousedown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseenter : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseleave : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mousemove : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseout : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseover : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method reset : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method resize : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method scroll : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method select : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method submit : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  method unload : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dom_AbstractElement.statics
  
  method select : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'c Js.t Js.meth
  
end

let static = Js.Unsafe.variable "Ext.dom.Element"

let select selector unique root =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "select")
    [|Js.Unsafe.inject
      selector;
      Js.Unsafe.inject
      unique;
      Js.Unsafe.inject
      root;
      |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

