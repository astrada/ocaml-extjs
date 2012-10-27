class type t =
object('self)
  
  
end

class type configs =
object('self)
  
  method alias : Js.js_string Js.t Js.js_array Js.t Js.prop
  method alternateClassName : _ Js.t Js.prop
  method config : _ Js.t Js.prop
  method extend : Js.js_string Js.t Js.prop
  method inheritableStatics : _ Js.t Js.prop
  method mixins : _ Js.t Js.prop
  method requires : Js.js_string Js.t Js.js_array Js.t Js.prop
  method singleton : bool Js.t Js.prop
  method statics : _ Js.t Js.prop
  method uses : Js.js_string Js.t Js.js_array Js.t Js.prop
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

let get_static () = Js.Unsafe.variable "Ext.Class"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

