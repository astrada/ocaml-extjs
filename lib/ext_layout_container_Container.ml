class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_layout_Layout.t
  inherit Ext_util_ElementContainer.t
  
  method getScrollRangeFlags : 'a Js.t Js.prop
  method overflowPadderEl : Ext_dom_Element.t Js.t Js.prop
  method beginLayout_obj : 'a Js.t -> unit Js.meth
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method calculateOverflow : Ext_layout_ContextItem.t Js.t -> 'a Js.t ->
    Js.number Js.t -> unit Js.meth
  method completeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method configureItem_obj : 'a Js.t -> unit Js.meth
  method doRenderPadder : 'a Js.t -> 'b Js.t -> unit Js.meth
  method getContainerSize : Ext_layout_ContextItem.t Js.t ->
    bool Js.t Js.optdef -> 'a Js.t Js.meth
  method getElementTarget : Ext_dom_Element.t Js.t Js.meth
  method getLayoutItems : Ext_Component.t Js.js_array Js.t Js.meth
  method getRenderTarget : Ext_dom_Element.t Js.t Js.meth
  method getRenderedItems : 'a Js.js_array Js.t Js.meth
  method getTarget : Ext_dom_Element.t Js.t Js.meth
  method getVisibleItems : 'a Js.js_array Js.t Js.meth
  method initLayout : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_layout_Layout.configs
  inherit Ext_util_ElementContainer.configs
  
  method itemCls : Js.js_string Js.t Js.prop
  method manageOverflow : Js.number Js.t Js.prop
  method reserveScrollbar : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_layout_Layout.events
  inherit Ext_util_ElementContainer.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_layout_Layout.statics
  inherit Ext_util_ElementContainer.statics
  
  
end

let static = Js.Unsafe.variable "Ext.layout.container.Container"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

