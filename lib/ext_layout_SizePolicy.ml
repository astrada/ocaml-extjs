class type t =
object('self)
  
  method readsHeight : bool Js.t Js.readonly_prop
  method readsWidth : bool Js.t Js.readonly_prop
  method setsHeight : bool Js.t Js.readonly_prop
  method setsWidth : bool Js.t Js.readonly_prop
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

let get_static () = Js.Unsafe.variable "Ext.layout.SizePolicy"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

