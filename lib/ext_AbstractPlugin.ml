class type t =
object('self)
  inherit Ext_Base.t
  
  method destroy : unit Js.meth
  method disable : unit Js.meth
  method enable : unit Js.meth
  method init : _ Js.t -> unit Js.meth
  method isPlugin : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method pluginId : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.AbstractPlugin"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

