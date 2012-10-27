class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_data_AbstractStore.t
  
  method currentPage : Js.number Js.t Js.prop
  method data : Ext_util_MixedCollection.t Js.t Js.prop
  method groupers : Ext_util_MixedCollection.t Js.t Js.prop
  method snapshot : Ext_util_MixedCollection.t Js.t Js.prop
  method add : _ Js.t -> Ext_data_Model.t Js.js_array Js.t Js.meth
  method addSorted : Ext_data_Model.t Js.t -> unit Js.meth
  method aggregate : _ Js.callback -> _ Js.t Js.optdef -> bool Js.t Js.optdef
    -> _ Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  method average : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method clearFilter : bool Js.t -> unit Js.meth
  method clearGrouping : unit Js.meth
  method collect : Js.js_string Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> _ Js.t Js.js_array Js.t Js.meth
  method commitChanges : unit Js.meth
  method count : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method each : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method filter : _ Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  method filterBy : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method find : Js.js_string Js.t -> _ Js.t -> Js.number Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.number Js.t Js.meth
  method findBy : _ Js.callback -> _ Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  method findExact : Js.js_string Js.t -> _ Js.t -> Js.number Js.t Js.optdef
    -> Js.number Js.t Js.meth
  method findRecord : Js.js_string Js.t -> _ Js.t -> Js.number Js.t Js.optdef
    -> bool Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    Ext_data_Model.t Js.t Js.meth
  method first : bool Js.t Js.optdef -> _ Js.t Js.meth
  method getAt : Js.number Js.t -> Ext_data_Model.t Js.t Js.meth
  method getById : _ Js.t -> Ext_data_Model.t Js.t Js.meth
  method getCount : Js.number Js.t Js.meth
  method getGroupString : Ext_data_Model.t Js.t -> Js.js_string Js.t Js.meth
  method getGroups : Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  method getNewRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method getPageFromRecordIndex : Js.number Js.t -> Js.number Js.t Js.meth
  method getRange : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Ext_data_Model.t Js.js_array Js.t Js.meth
  method getTotalCount : Js.number Js.t Js.meth
  method getUpdatedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  method group : _ Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  method guaranteeRange : _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit
    Js.meth
  method indexOf : Ext_data_Model.t Js.t -> Js.number Js.t Js.meth
  method indexOfId : Js.js_string Js.t -> Js.number Js.t Js.meth
  method indexOfTotal : Ext_data_Model.t Js.t -> Js.number Js.t Js.meth
  method insert : Js.number Js.t -> Ext_data_Model.t Js.js_array Js.t -> unit
    Js.meth
  method isFiltered : bool Js.t Js.meth
  method isGrouped : bool Js.t Js.meth
  method last : bool Js.t Js.optdef -> _ Js.t Js.meth
  method load_store : _ Js.t Js.optdef -> unit Js.meth
  method loadData : _ Js.t -> bool Js.t Js.optdef -> unit Js.meth
  method loadPage : Js.number Js.t -> _ Js.t -> unit Js.meth
  method loadRawData : _ Js.t Js.js_array Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  method loadRecords : Ext_data_Model.t Js.js_array Js.t -> _ Js.t -> unit
    Js.meth
  method max : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method min : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method nextPage : _ Js.t -> unit Js.meth
  method prefetch : _ Js.t Js.optdef -> unit Js.meth
  method prefetchPage : Js.number Js.t -> _ Js.t Js.optdef -> unit Js.meth
  method prefetchRange : _ Js.t -> _ Js.t -> unit Js.meth
  method previousPage : _ Js.t -> unit Js.meth
  method query : Js.js_string Js.t -> _ Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    Ext_util_MixedCollection.t Js.t Js.meth
  method queryBy : _ Js.callback -> _ Js.t Js.optdef ->
    Ext_util_MixedCollection.t Js.t Js.meth
  method rejectChanges : unit Js.meth
  method reload : _ Js.t -> unit Js.meth
  method remove : _ Js.t -> unit Js.meth
  method removeAll_bool : bool Js.t -> unit Js.meth
  method removeAt : Js.number Js.t -> unit Js.meth
  method sort : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Ext_util_Sorter.t Js.js_array Js.t Js.meth
  method sum : Js.js_string Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_data_AbstractStore.configs
  
  method buffered : bool Js.t Js.prop
  method clearOnPageLoad : bool Js.t Js.prop
  method clearRemovedOnLoad : bool Js.t Js.prop
  method data : _ Js.t Js.prop
  method groupDir : Js.js_string Js.t Js.prop
  method groupField : Js.js_string Js.t Js.prop
  method leadingBufferZone : Js.number Js.t Js.prop
  method pageSize : Js.number Js.t Js.prop
  method proxy : _ Js.t Js.prop
  method purgePageCount : Js.number Js.t Js.prop
  method remoteFilter : bool Js.t Js.prop
  method remoteGroup : bool Js.t Js.prop
  method remoteSort : bool Js.t Js.prop
  method sortOnFilter : bool Js.t Js.prop
  method trailingBufferZone : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_data_AbstractStore.events
  
  method beforeprefetch : (t Js.t -> Ext_data_Operation.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method groupchange : (t Js.t -> Ext_util_Grouper.t Js.js_array Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method prefetch : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> bool Js.t
    -> Ext_data_Operation.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_data_AbstractStore.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.data.Store"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

