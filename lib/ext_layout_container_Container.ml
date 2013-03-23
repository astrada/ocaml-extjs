class type t =
object('self)
  inherit Ext_util_ElementContainer.t
  inherit Ext_layout_Layout.t
  
  method beginLayout_obj : _ Js.t -> unit Js.meth
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  method configureItem_obj : _ Js.t -> unit Js.meth
  method getContainerSize : Ext_layout_ContextItem.t Js.t ->
    bool Js.t Js.optdef -> _ Js.t Js.meth
  method getElementTarget : Ext_dom_Element.t Js.t Js.meth
  method getLayoutItems : Ext_Component.t Js.js_array Js.t Js.meth
  method getRenderTarget : Ext_dom_Element.t Js.t Js.meth
  method getRenderedItems : _ Js.js_array Js.t Js.meth
  method getTarget : Ext_dom_Element.t Js.t Js.meth
  method getVisibleItems : _ Js.js_array Js.t Js.meth
  method overflowPadderEl : Ext_dom_Element.t Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_util_ElementContainer.configs
  inherit Ext_layout_Layout.configs
  
  method itemCls : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_util_ElementContainer.events
  inherit Ext_layout_Layout.events
  
  
end

class type statics =
object
  inherit Ext_layout_Layout.statics
  inherit Ext_util_ElementContainer.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.layout.container.Container"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

