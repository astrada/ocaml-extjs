class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method count : Js.number Js.t Js.prop
  method loaded : bool Js.t Js.prop
  method records : Ext_data_Model.t Js.js_array Js.t Js.prop
  method success : bool Js.t Js.prop
  method total : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.ResultSet"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

