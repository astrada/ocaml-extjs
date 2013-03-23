class type t =
object('self)
  inherit Ext_ElementLoader.t
  
  method setTarget : _ Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_ElementLoader.configs
  
  method loadMask : _ Js.t Js.prop
  method renderer_2 : _ Js.t Js.prop
  method scripts : bool Js.t Js.prop
  method target : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_ElementLoader.events
  
  
end

class type statics =
object
  inherit Ext_ElementLoader.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.ComponentLoader"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

