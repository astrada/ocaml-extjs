class type t =
object('self)
  
  
end

class type configs =
object('self)
  
  method alias : Js.js_string Js.t Js.js_array Js.t Js.prop
  method alternateClassName : 'a Js.t Js.prop
  method config : 'a Js.t Js.prop
  method extend : Js.js_string Js.t Js.prop
  method inheritableStatics : 'a Js.t Js.prop
  method mixins : 'a Js.t Js.prop
  method requires : Js.js_string Js.t Js.js_array Js.t Js.prop
  method singleton : bool Js.t Js.prop
  method statics : 'a Js.t Js.prop
  method uses : Js.js_string Js.t Js.js_array Js.t Js.prop
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

let static = Js.Unsafe.variable "Ext.Class"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

