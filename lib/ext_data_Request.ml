class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method action : Js.js_string Js.t Js.prop
  method _method : Js.js_string Js.t Js.prop
  method params : _ Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.Request"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

