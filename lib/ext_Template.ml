class type t =
object('self)
  inherit Ext_Base.t
  
  method append : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method apply : _ Js.t -> Js.js_string Js.t Js.meth
  method applyOut : _ Js.t -> _ Js.js_array Js.t -> _ Js.js_array Js.t
    Js.meth
  method applyTemplate : _ Js.t -> Js.js_string Js.t Js.meth
  method compile : 'self Js.t Js.meth
  method insertAfter : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method insertBefore : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method insertFirst : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method overwrite : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method set : Js.js_string Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method isTemplate : bool Js.t Js.prop
  
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
  
  method from : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.Template"

let static = get_static ()

let from el config =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "from")
    [|Js.Unsafe.inject el; Js.Unsafe.inject config; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

