class type t =
object('self)
  inherit Ext_container_AbstractContainer.t
  
  method getChildByElement : _ Js.t -> bool Js.t -> #Ext_Component.t Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_container_AbstractContainer.configs
  
  method anchorSize : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_container_AbstractContainer.events
  
  
end

class type statics =
object
  inherit Ext_container_AbstractContainer.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.container.Container"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

