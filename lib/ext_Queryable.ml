class type t =
object('self)
  inherit Ext_Base.t
  
  method child : _ Js.t Js.optdef -> _ Js.t Js.meth
  method down : _ Js.t Js.optdef -> _ Js.t Js.meth
  method query : Js.js_string Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method queryBy : _ Js.callback -> _ Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  method queryById : Js.js_string Js.t -> #Ext_Component.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.Queryable"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

