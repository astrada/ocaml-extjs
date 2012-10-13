class type t =
object('self)
  
  method toString : Js.js_string Js.t Js.meth
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  method ignore : bool Js.t Js.prop
  method notify : bool Js.t Js.prop
  method handle : 'self Js.t -> unit Js.meth
  method raise_ : 'a Js.t -> unit Js.meth
  
end

let static = Js.Unsafe.variable "Ext.Error"

let handle err =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "handle")
    [|Js.Unsafe.inject err; |]

let raise_ err =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "raise")
    [|Js.Unsafe.inject err; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

