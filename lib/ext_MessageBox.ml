class type t =
object('self)
  inherit Ext_window_MessageBox.t
  
  
end

class type configs =
object('self)
  inherit Ext_window_MessageBox.configs
  
  
end

class type events =
object
  inherit Ext_window_MessageBox.events
  
  
end

class type statics =
object
  inherit Ext_window_MessageBox.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.MessageBox"

let static = get_static ()

let get_instance () = Js.Unsafe.variable "Ext.MessageBox"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

