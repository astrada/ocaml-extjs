class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Sortable.t
  
  method defaultProxyType : Js.js_string Js.t Js.prop
  method filters : Ext_util_MixedCollection.t Js.t Js.prop
  method isDestroyed : bool Js.t Js.prop
  method isStore : bool Js.t Js.prop
  method removed : Ext_data_Model.t Js.js_array Js.t Js.prop
  method getModifiedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getNewRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getProxy : #Ext_data_proxy_Proxy.t Js.t Js.meth
  method getRemovedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getUpdatedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method isLoading : bool Js.t Js.meth
  method load : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method reload : _ Js.t -> unit Js.meth
  method removeAll : unit Js.meth
  method resumeAutoSync : unit Js.meth
  method setProxy : _ Js.t -> #Ext_data_proxy_Proxy.t Js.t Js.meth
  method suspendAutoSync : unit Js.meth
  method sync : _ Js.t Js.optdef -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Sortable.configs
  
  method autoLoad : _ Js.t Js.prop
  method autoSync : bool Js.t Js.prop
  method batchUpdateMode : Js.js_string Js.t Js.prop
  method fields : _ Js.t Js.js_array Js.t Js.prop
  method filterOnLoad : bool Js.t Js.prop
  method filters : _ Js.t Js.prop
  method model : Js.js_string Js.t Js.prop
  method proxy : _ Js.t Js.prop
  method remoteFilter : bool Js.t Js.prop
  method remoteSort : bool Js.t Js.prop
  method sortOnLoad : bool Js.t Js.prop
  method statefulFilters : bool Js.t Js.prop
  method storeId : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Sortable.events
  
  method add : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeload : (t Js.t -> Ext_data_Operation.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method beforesync : (_ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method bulkremove : (t Js.t -> Ext_data_Model.t Js.js_array Js.t ->
    Js.number Js.t Js.js_array Js.t -> bool Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method clear : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method datachanged : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method load : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> bool Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method metachange : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method refresh : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method remove : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    bool Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method update : (t Js.t -> Ext_data_Model.t Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method write : (t Js.t -> Ext_data_Operation.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  inherit Ext_util_Sortable.statics
  
  method create_store : _ Js.t -> 'self Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.data.AbstractStore"

let static = get_static ()

let create store =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "create")
    [|Js.Unsafe.inject store; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

