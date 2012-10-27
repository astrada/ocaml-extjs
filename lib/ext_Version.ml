class type t =
object('self)
  
  method equals : _ Js.t -> bool Js.t Js.meth
  method getBuild : Js.number Js.t Js.meth
  method getMajor : Js.number Js.t Js.meth
  method getMinor : Js.number Js.t Js.meth
  method getPatch : Js.number Js.t Js.meth
  method getRelease : Js.number Js.t Js.meth
  method getShortVersion : Js.js_string Js.t Js.meth
  method gt : _ Js.t -> bool Js.t Js.meth
  method gtEq : _ Js.t -> bool Js.t Js.meth
  method isGreaterThan : _ Js.t -> bool Js.t Js.meth
  method isGreaterThanOrEqual : _ Js.t -> bool Js.t Js.meth
  method isLessThan : _ Js.t -> bool Js.t Js.meth
  method isLessThanOrEqual : _ Js.t -> bool Js.t Js.meth
  method lt : _ Js.t -> bool Js.t Js.meth
  method ltEq : _ Js.t -> bool Js.t Js.meth
  method _match : _ Js.t -> bool Js.t Js.meth
  method toArray : Js.number Js.t Js.js_array Js.t Js.meth
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  method compare : Js.js_string Js.t -> Js.js_string Js.t -> Js.number Js.t
    Js.meth
  method getComponentValue : _ Js.t -> _ Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.Version"

let static = get_static ()

let compare current target =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "compare")
    [|Js.Unsafe.inject current; Js.Unsafe.inject target; |]

let getComponentValue value =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "getComponentValue")
    [|Js.Unsafe.inject value; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

