class type t =
object('self)
  inherit Ext_Base.t
  
  method failureType : Js.js_string Js.t Js.prop
  method response : 'a Js.t Js.prop
  method result : 'a Js.t Js.prop
  method type_ : Js.js_string Js.t Js.prop
  method run : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method failure : 'a Js.callback Js.prop
  method form : 'a Js.t Js.prop
  method headers : 'a Js.t Js.prop
  method method_ : Js.js_string Js.t Js.prop
  method params : 'a Js.t Js.prop
  method reset : bool Js.t Js.prop
  method scope : 'a Js.t Js.prop
  method submitEmptyText : bool Js.t Js.prop
  method success : 'a Js.callback Js.prop
  method timeout : Js.number Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  method waitMsg : Js.js_string Js.t Js.prop
  method waitTitle : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method cLIENT_INVALID : Js.js_string Js.t Js.prop
  method cONNECT_FAILURE : Js.js_string Js.t Js.prop
  method lOAD_FAILURE : Js.js_string Js.t Js.prop
  method sERVER_INVALID : Js.js_string Js.t Js.prop
  
end

let static = Js.Unsafe.variable "Ext.form.action.Action"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

