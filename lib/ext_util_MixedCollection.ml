class type t =
object('self)
  inherit Ext_util_AbstractMixedCollection.t
  inherit Ext_util_Sortable.t
  
  method findInsertionIndex : _ Js.t -> _ Js.callback Js.optdef ->
    Js.number Js.t Js.meth
  method reorder : _ Js.t -> unit Js.meth
  method sortBy : _ Js.callback -> unit Js.meth
  method sortByKey : Js.js_string Js.t Js.optdef -> _ Js.callback Js.optdef
    -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_util_AbstractMixedCollection.configs
  inherit Ext_util_Sortable.configs
  
  method allowFunctions : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_util_AbstractMixedCollection.events
  inherit Ext_util_Sortable.events
  
  
end

class type statics =
object
  inherit Ext_util_AbstractMixedCollection.statics
  inherit Ext_util_Sortable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.MixedCollection"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

