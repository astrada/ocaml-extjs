class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_util_Floating.t
  
  method floatParent : _ Js.t Js.readonly_prop
  method zIndexManager : Ext_ZIndexManager.t Js.t Js.readonly_prop
  method zIndexParent : _ Js.t Js.readonly_prop
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterHide : _ Js.callback Js.optdef -> _ Js.t Js.optdef -> unit
    Js.meth
  method afterRender : unit Js.meth
  method afterSetPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method beforeShow : unit Js.meth
  method bubble : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  method cancelFocus : unit Js.meth
  method cloneConfig : _ Js.t -> 'self Js.t Js.meth
  method findParentBy : _ Js.callback -> _ Js.t Js.meth
  method findParentByType : _ Js.t -> _ Js.t Js.meth
  method focus : bool Js.t Js.optdef -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  method getBox : bool Js.t Js.optdef -> _ Js.t Js.meth
  method getBubbleTarget : _ Js.t Js.meth
  method getEl : Ext_dom_Element.t Js.t Js.meth
  method getId : Js.js_string Js.t Js.meth
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  method getXType : Js.js_string Js.t Js.meth
  method hide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method onResize : unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method onShowComplete : _ Js.callback Js.optdef -> _ Js.t Js.optdef -> unit
    Js.meth
  method scrollBy : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method setAutoScroll : bool Js.t -> 'self Js.t Js.meth
  method setLoading : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method setOverflowXY : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  method setPagePosition : Js.number Js.t -> Js.number Js.t ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method show : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> 'self Js.t Js.meth
  method showAt : Js.number Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    unit Js.meth
  method updateBox : _ Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_util_Floating.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterHide : ('self Js.t, _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> unit) Js.meth_callback Js.writeonly_prop
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterSetPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method beforeShow : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onResize : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onShowComplete : ('self Js.t, _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method autoScroll : bool Js.t Js.prop
  method columnWidth : _ Js.t Js.prop
  method draggable_obj : _ Js.t Js.prop
  method floating : bool Js.t Js.prop
  method formBind : bool Js.t Js.prop
  method overflowX : Js.js_string Js.t Js.prop
  method overflowY : Js.js_string Js.t Js.prop
  method region : Js.js_string Js.t Js.prop
  method resizable : _ Js.t Js.prop
  method resizeHandles : Js.js_string Js.t Js.prop
  method toFrontOnShow : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_util_Floating.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_util_Floating.statics
  
  
end

let static = Js.Unsafe.variable "Ext.Component"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

