class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method convert : _ Js.callback Js.prop
  method dateFormat : Js.js_string Js.t Js.prop
  method defaultValue : _ Js.t Js.prop
  method mapping : _ Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method persist : bool Js.t Js.prop
  method serialize : _ Js.callback Js.prop
  method sortDir : Js.js_string Js.t Js.prop
  method sortType : _ Js.callback Js.prop
  method _type : _ Js.t Js.prop
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

let get_static () = Js.Unsafe.variable "Ext.data.Field"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

