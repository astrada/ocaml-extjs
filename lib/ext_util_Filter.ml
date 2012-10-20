class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method anyMatch : bool Js.t Js.prop
  method caseSensitive : bool Js.t Js.prop
  method exactMatch : bool Js.t Js.prop
  method filterFn : _ Js.callback Js.prop
  method property : Js.js_string Js.t Js.prop
  method root : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.Filter"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

