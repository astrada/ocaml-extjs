class type t =
object('self)
  inherit Ext_view_Table.t
  
  
end

class type configs =
object('self)
  inherit Ext_view_Table.configs
  
  method autoScroll : bool Js.t Js.prop
  method stripeRows : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_view_Table.events
  
  
end

class type statics =
object
  inherit Ext_view_Table.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.View"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

