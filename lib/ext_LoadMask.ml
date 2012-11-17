class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_util_Bindable.t
  inherit Ext_util_Floating.t
  
  method afterRender : unit Js.meth
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method bindStore_store : Ext_data_Store.t Js.t -> unit Js.meth
  method getStoreListeners : _ Js.t Js.meth
  method hide_mask : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method onDestroy : unit Js.meth
  method onDisable : unit Js.meth
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method show_mask : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_util_Bindable.configs
  inherit Ext_util_Floating.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method baseCls : Js.js_string Js.t Js.prop
  method floating : bool Js.t Js.prop
  method focusOnToFront : bool Js.t Js.prop
  method maskCls : Js.js_string Js.t Js.prop
  method msg : Js.js_string Js.t Js.prop
  method msgCls : Js.js_string Js.t Js.prop
  method renderTpl : _ Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method useMsg : bool Js.t Js.prop
  method useTargetEl : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_util_Bindable.events
  inherit Ext_util_Floating.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_util_Bindable.statics
  inherit Ext_util_Floating.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.LoadMask"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

