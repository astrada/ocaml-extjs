class type t =
object('self)
  inherit Ext_Base.t
  
  method clear : Js.js_string Js.t -> unit Js.meth
  method get : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  method getProvider : Ext_state_Provider.t Js.t Js.meth
  method set : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  method setProvider : Ext_state_Provider.t Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.state.Manager"

let static = get_static ()

let get_instance () = Js.Unsafe.variable "Ext.state.Manager"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

