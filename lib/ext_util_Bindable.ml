class type t =
object('self)
  inherit Ext_Base.t
  
  method bindStore : _ Js.t Js.optdef -> unit Js.meth
  method bindStoreListeners : #Ext_data_AbstractStore.t Js.t -> unit Js.meth
  method getStore : #Ext_data_AbstractStore.t Js.t Js.meth
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  method onBindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method onUnbindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method unbindStoreListeners : #Ext_data_AbstractStore.t Js.t -> unit
    Js.meth
  
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

let get_static () = Js.Unsafe.variable "Ext.util.Bindable"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

