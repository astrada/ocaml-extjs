class type t =
object('self)
  inherit Ext_dom_AbstractElement.t
  
  method addClsOnClick : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method addClsOnFocus : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method addClsOnOver : Js.js_string Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method addKeyListener : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    Ext_util_KeyMap.t Js.t Js.meth
  method addKeyMap : _ Js.t -> Ext_util_KeyMap.t Js.t Js.meth
  method addListener : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method animate : _ Js.t -> 'self Js.t Js.meth
  method blur : 'self Js.t Js.meth
  method boxWrap : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method cacheScrollValues : _ Js.callback Js.meth
  method center : _ Js.t -> unit Js.meth
  method clean : bool Js.t Js.optdef -> unit Js.meth
  method clearListeners : 'self Js.t Js.meth
  method clearOpacity : 'self Js.t Js.meth
  method clearPositioning : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method clip : 'self Js.t Js.meth
  method createProxy : _ Js.t -> _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  method createShim : 'self Js.t Js.meth
  method enableDisplayMode : Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method fadeIn : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method fadeOut : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method focus : Js.number Js.t Js.optdef -> 'self Js.t Js.meth
  method focusable : _ Js.t -> bool Js.t Js.meth
  method frame : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method getAttributeNS : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.meth
  method getColor : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  method getComputedHeight : Js.number Js.t Js.meth
  method getComputedWidth : Js.number Js.t Js.meth
  method getFrameWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getLoader : Ext_ElementLoader.t Js.t Js.meth
  method getLocalX : Js.number Js.t Js.meth
  method getLocalXY : _ Js.js_array Js.t Js.meth
  method getLocalY : Js.number Js.t Js.meth
  method getScroll : _ Js.t Js.meth
  method getScrollTop : Js.number Js.t Js.meth
  method getStyleSize : _ Js.t Js.meth
  method getTextWidth : Js.js_string Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  method getX : Js.number Js.t Js.meth
  method getY : Js.number Js.t Js.meth
  method ghost : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method hide : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method highlight : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method hover : _ Js.callback -> _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method initDD : Js.js_string Js.t -> _ Js.t -> _ Js.t -> Ext_dd_DD.t Js.t
    Js.meth
  method initDDProxy : Js.js_string Js.t -> _ Js.t -> _ Js.t ->
    Ext_dd_DDProxy.t Js.t Js.meth
  method initDDTarget : Js.js_string Js.t -> _ Js.t -> _ Js.t ->
    Ext_dd_DDTarget.t Js.t Js.meth
  method isBorderBox : bool Js.t Js.meth
  method isDisplayed : bool Js.t Js.meth
  method isFocusable : _ Js.t -> bool Js.t Js.meth
  method isMasked : bool Js.t Js.meth
  method isScrollable : bool Js.t Js.meth
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  method load : _ Js.t -> 'self Js.t Js.meth
  method mask_element : Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method monitorMouseLeave : Js.number Js.t -> _ Js.callback ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  method needsTabIndex : unit Js.meth
  method on : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method position : Js.js_string Js.t Js.optdef -> Js.number Js.t Js.optdef
    -> Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> unit Js.meth
  method puff : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method purgeAllListeners : 'self Js.t Js.meth
  method relayEvent : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  method removeAllListeners : 'self Js.t Js.meth
  method removeListener : Js.js_string Js.t -> _ Js.callback -> _ Js.t ->
    'self Js.t Js.meth
  method scroll : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    bool Js.t Js.meth
  method scrollBy : _ Js.t -> _ Js.t -> _ Js.t -> 'self Js.t Js.meth
  method scrollIntoView : _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method scrollTo : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef
    -> 'self Js.t Js.meth
  method selectable : 'self Js.t Js.meth
  method setDisplayed : _ Js.t -> 'self Js.t Js.meth
  method setOpacity : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setPositioning : _ Js.t -> 'self Js.t Js.meth
  method setScrollLeft : Js.number Js.t -> 'self Js.t Js.meth
  method setScrollTop : Js.number Js.t -> 'self Js.t Js.meth
  method setVisible : bool Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method show : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method slideIn : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method slideOut : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  method swallowEvent : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method switchOff : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method toggle : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t -> 'self Js.t
    Js.meth
  method unclip : 'self Js.t Js.meth
  method unmask : unit Js.meth
  method unselectable : 'self Js.t Js.meth
  method update_html : Js.js_string Js.t -> bool Js.t Js.optdef ->
    _ Js.callback Js.optdef -> 'self Js.t Js.meth
  method autoBoxAdjust : bool Js.t Js.prop
  method originalDisplay : Js.js_string Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_dom_AbstractElement.configs
  
  
end

class type events =
object
  inherit Ext_dom_AbstractElement.events
  
  method _DOMActivate : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMAttrModified : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMCharacterDataModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMFocusIn : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMFocusOut : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMNodeInserted : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMNodeInsertedIntoDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMNodeRemoved : (Ext_EventObject.t Js.t -> Dom_html.element Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMNodeRemovedFromDocument : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method _DOMSubtreeModified : (Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method abort : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method blur : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method change : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method click : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method contextmenu : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method dblclick : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method error : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method focus : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method keydown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method keypress : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method keyup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method load : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method mousedown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseenter : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseleave : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mousemove : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseout : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseover : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method reset : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method resize : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method scroll : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method select : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method submit : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method unload : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_dom_AbstractElement.statics
  
  method select : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.dom.Element"

let static = get_static ()

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

