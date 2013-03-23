class type t =
object('self)
  inherit Ext_container_Container.t
  
  method initComponent : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method isViewport : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_container_Container.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_container_Container.events
  
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.container.Viewport"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

