class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_data_proxy_Proxy.t
  inherit Ext_data_proxy_Server.t
  
  method actionMethods : _ Js.t Js.prop
  method getMethod : Ext_data_Request.t Js.t -> Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_data_proxy_Proxy.configs
  inherit Ext_data_proxy_Server.configs
  
  method headers : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_data_proxy_Proxy.events
  inherit Ext_data_proxy_Server.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_data_proxy_Proxy.statics
  inherit Ext_data_proxy_Server.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.proxy.Ajax"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

