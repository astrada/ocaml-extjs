class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragDrop.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragDrop.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragDrop.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.dd.DDTarget"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

