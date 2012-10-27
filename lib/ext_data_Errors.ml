class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_AbstractMixedCollection.t
  inherit Ext_util_MixedCollection.t
  
  method getByField : Js.js_string Js.t -> _ Js.t Js.js_array Js.t Js.meth
  method isValid : bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_AbstractMixedCollection.configs
  inherit Ext_util_MixedCollection.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_AbstractMixedCollection.events
  inherit Ext_util_MixedCollection.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_AbstractMixedCollection.statics
  inherit Ext_util_MixedCollection.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.Errors"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

