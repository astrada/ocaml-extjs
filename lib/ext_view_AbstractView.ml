class type t =
object('self)
  inherit Ext_Component.t
  inherit Ext_util_Bindable.t
  
  method afterRender : unit Js.meth
  method bindStore_view : Ext_data_Store.t Js.t -> unit Js.meth
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    _ Js.t Js.js_array Js.t Js.meth
  method deselect : _ Js.t -> bool Js.t -> unit Js.meth
  method findItemByChild : Dom_html.element Js.t -> Dom_html.element Js.t
    Js.meth
  method findTargetByEvent : Ext_EventObject.t Js.t -> unit Js.meth
  method getNode : _ Js.t -> Dom_html.element Js.t Js.meth
  method getNodes : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  method getRecord : _ Js.t -> Ext_data_Model.t Js.t Js.meth
  method getRecords : Dom_html.element Js.t Js.js_array Js.t ->
    Ext_data_Model.t Js.js_array Js.t Js.meth
  method getSelectedNodes : Dom_html.element Js.t Js.js_array Js.t Js.meth
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  method getStore_view : Ext_data_Store.t Js.t Js.meth
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  method initComponent : unit Js.meth
  method isSelected : _ Js.t -> bool Js.t Js.meth
  method onBindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method onDestroy : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method onUnbindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method prepareData : _ Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    _ Js.t Js.meth
  method refresh : unit Js.meth
  method refreshNode : Js.number Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Component.configs
  inherit Ext_util_Bindable.configs
  
  method blockRefresh : bool Js.t Js.prop
  method deferEmptyText : bool Js.t Js.prop
  method deferInitialRefresh : bool Js.t Js.prop
  method disableSelection : bool Js.t Js.prop
  method emptyText : Js.js_string Js.t Js.prop
  method itemCls : Js.js_string Js.t Js.prop
  method itemSelector : Js.js_string Js.t Js.prop
  method itemTpl : _ Js.t Js.prop
  method loadMask : _ Js.t Js.prop
  method loadingCls : Js.js_string Js.t Js.prop
  method loadingHeight : Js.number Js.t Js.prop
  method loadingText : Js.js_string Js.t Js.prop
  method overItemCls : Js.js_string Js.t Js.prop
  method preserveScrollOnRefresh : bool Js.t Js.prop
  method selectedItemCls : Js.js_string Js.t Js.prop
  method singleSelect : bool Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method tpl : _ Js.t Js.prop
  method trackOver : bool Js.t Js.prop
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_Component.events
  inherit Ext_util_Bindable.events
  
  method beforerefresh : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method itemadd : (Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    Dom_html.element Js.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method itemremove : (Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method itemupdate : (Ext_data_Model.t Js.t -> Js.number Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method refresh : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method viewready : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Component.statics
  inherit Ext_util_Bindable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.view.AbstractView"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

