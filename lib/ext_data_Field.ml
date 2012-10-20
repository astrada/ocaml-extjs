class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method convert : 'a Js.callback Js.prop
  method dateFormat : Js.js_string Js.t Js.prop
  method defaultValue : 'a Js.t Js.prop
  method mapping : 'a Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method persist : bool Js.t Js.prop
  method serialize : 'a Js.callback Js.prop
  method sortDir : Js.js_string Js.t Js.prop
  method sortType : 'a Js.callback Js.prop
  method _type : 'a Js.t Js.prop
  method useNull : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.data.Field"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

