class type t =
object('self)
  inherit Ext_util_Sorter.t
  
  method getGroupString : Ext_data_Model.t Js.t -> Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_util_Sorter.configs
  
  
end

class type events =
object
  inherit Ext_util_Sorter.events
  
  
end

class type statics =
object
  inherit Ext_util_Sorter.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Grouper"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

