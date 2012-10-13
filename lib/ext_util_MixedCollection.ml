class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_AbstractMixedCollection.t
  inherit Ext_util_Sortable.t
  
  method findInsertionIndex : 'a Js.t -> 'b Js.callback Js.optdef ->
    Js.number Js.t Js.meth
  method reorder : 'a Js.t -> unit Js.meth
  method sortBy : 'a Js.callback -> unit Js.meth
  method sortByKey : Js.js_string Js.t Js.optdef -> 'a Js.callback Js.optdef
    -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_AbstractMixedCollection.configs
  inherit Ext_util_Sortable.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_AbstractMixedCollection.events
  inherit Ext_util_Sortable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_AbstractMixedCollection.statics
  inherit Ext_util_Sortable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.MixedCollection"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o
