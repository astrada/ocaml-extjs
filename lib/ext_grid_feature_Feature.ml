class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method collectData : bool Js.t Js.prop
  method disabled : bool Js.t Js.prop
  method eventPrefix : Js.js_string Js.t Js.prop
  method eventSelector : Js.js_string Js.t Js.prop
  method grid : _ Js.t Js.prop
  method hasFeatureEvent : bool Js.t Js.prop
  method view : _ Js.t Js.prop
  method attachEvents : unit Js.meth
  method disable : unit Js.meth
  method enable : unit Js.meth
  method getAdditionalData : _ Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit Js.meth
  method getFireEventArgs : _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit
    Js.meth
  method getMetaRowTplFragments : unit Js.meth
  method mutateMetaRowTpl : _ Js.js_array Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method attachEvents : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method getAdditionalData : ('self Js.t, _ Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method getFireEventArgs : ('self Js.t, _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t
    -> unit) Js.meth_callback Js.writeonly_prop
  method getMetaRowTplFragments : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method mutateMetaRowTpl : ('self Js.t, _ Js.js_array Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.feature.Feature"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

