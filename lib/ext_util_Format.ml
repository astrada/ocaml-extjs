class type t =
object('self)
  
  method currencyAtEnd : bool Js.t Js.prop
  method currencyPrecision : Js.number Js.t Js.prop
  method currencySign : Js.js_string Js.t Js.prop
  method decimalSeparator : Js.js_string Js.t Js.prop
  method thousandSeparator : Js.js_string Js.t Js.prop
  method capitalize : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method currency : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> bool Js.t Js.optdef -> Js.js_string Js.t
    Js.meth
  method date : _ Js.t -> Js.js_string Js.t Js.optdef -> Js.js_string Js.t
    Js.meth
  method dateRenderer : Js.js_string Js.t -> _ Js.callback Js.meth
  method defaultValue : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method ellipsis : Js.js_string Js.t -> Js.number Js.t -> bool Js.t ->
    Js.js_string Js.t Js.meth
  method escapeRegex : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method fileSize : _ Js.t -> Js.js_string Js.t Js.meth
  method format : Js.js_string Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    -> Js.js_string Js.t Js.meth
  method htmlDecode : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method htmlEncode : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method leftPad : Js.js_string Js.t -> Js.number Js.t ->
    Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.meth
  method lowercase : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method math : _ Js.callback Js.meth
  method nl2br : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method number : Js.number Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  method numberRenderer : Js.js_string Js.t -> _ Js.callback Js.meth
  method parseBox : _ Js.t -> _ Js.t Js.meth
  method plural : Js.number Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  method round : _ Js.t -> Js.number Js.t -> Js.number Js.t Js.meth
  method stripScripts : _ Js.t -> Js.js_string Js.t Js.meth
  method stripTags : _ Js.t -> Js.js_string Js.t Js.meth
  method substr : Js.js_string Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.js_string Js.t Js.meth
  method trim : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method undef : _ Js.t -> _ Js.t Js.meth
  method uppercase : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method usMoney : _ Js.t -> Js.js_string Js.t Js.meth
  
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

let static = Js.Unsafe.variable "Ext.util.Format"

let get_instance () = Js.Unsafe.variable "Ext.util.Format"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

