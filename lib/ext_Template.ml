class type t =
object('self)
  inherit Ext_Base.t
  
  method isTemplate : bool Js.t Js.prop
  method append : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method apply : 'a Js.t -> Js.js_string Js.t Js.meth
  method applyOut : 'a Js.t -> 'b Js.js_array Js.t -> 'c Js.js_array Js.t
    Js.meth
  method applyTemplate : 'a Js.t -> Js.js_string Js.t Js.meth
  method compile : 'self Js.t Js.meth
  method insertAfter : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method insertBefore : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method insertFirst : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method overwrite : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method set : Js.js_string Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method compiled : bool Js.t Js.prop
  method disableFormats : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method from : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  
end

let static = Js.Unsafe.variable "Ext.Template"

let from el config =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "from")
    [|Js.Unsafe.inject el; Js.Unsafe.inject config; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

