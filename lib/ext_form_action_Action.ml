class type t =
object('self)
  inherit Ext_Base.t
  
  method failureType : Js.js_string Js.t Js.prop
  method response : _ Js.t Js.prop
  method result : _ Js.t Js.prop
  method _type : Js.js_string Js.t Js.prop
  method run : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method failure : _ Js.callback Js.prop
  method form : _ Js.t Js.prop
  method headers : _ Js.t Js.prop
  method _method : Js.js_string Js.t Js.prop
  method params : _ Js.t Js.prop
  method reset : bool Js.t Js.prop
  method scope : _ Js.t Js.prop
  method submitEmptyText : bool Js.t Js.prop
  method success : _ Js.callback Js.prop
  method timeout : Js.number Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  method waitMsg : Js.js_string Js.t Js.prop
  method waitTitle : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method _CLIENT_INVALID : Js.js_string Js.t Js.prop
  method _CONNECT_FAILURE : Js.js_string Js.t Js.prop
  method _LOAD_FAILURE : Js.js_string Js.t Js.prop
  method _SERVER_INVALID : Js.js_string Js.t Js.prop
  
end

let get_static () = Js.Unsafe.variable "Ext.form.action.Action"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

