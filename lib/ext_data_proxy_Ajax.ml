class type t =
object('self)
  inherit Ext_data_proxy_Server.t
  
  method getMethod : Ext_data_Request.t Js.t -> Js.js_string Js.t Js.meth
  method actionMethods : _ Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_data_proxy_Server.configs
  
  method binary : bool Js.t Js.prop
  method headers : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_data_proxy_Server.events
  
  
end

class type statics =
object
  inherit Ext_data_proxy_Server.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.proxy.Ajax"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

