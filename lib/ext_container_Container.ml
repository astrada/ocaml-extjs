class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  
  method afterHide : _ Js.callback Js.optdef -> _ Js.t Js.optdef -> unit
    Js.meth
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method getChildByElement : _ Js.t -> bool Js.t -> #Ext_Component.t Js.t
    Js.meth
  method onAdded_container : 'self Js.t -> Js.number Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  
  method afterHide : ('self Js.t, _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> unit) Js.meth_callback Js.writeonly_prop
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onAdded_container : ('self Js.t, 'self Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method anchorSize : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.container.Container"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

