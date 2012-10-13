class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_util_Bindable.t
  
  method afterRender : unit Js.meth
  method bindStore_2 : Ext_data_Store.t Js.t -> unit Js.meth
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    'a Js.t Js.js_array Js.t Js.meth
  method deselect : 'a Js.t -> bool Js.t -> unit Js.meth
  method findItemByChild : Dom_html.element Js.t -> Dom_html.element Js.t
    Js.meth
  method findTargetByEvent : Ext_EventObject.t Js.t -> unit Js.meth
  method getNode : 'a Js.t -> Dom_html.element Js.t Js.meth
  method getNodes : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  method getRecord : 'a Js.t -> Ext_data_Model.t Js.t Js.meth
  method getRecords : Dom_html.element Js.t Js.js_array Js.t ->
    Ext_data_Model.t Js.js_array Js.t Js.meth
  method getSelectedNodes : Dom_html.element Js.t Js.js_array Js.t Js.meth
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  method getStore_2 : Ext_data_Store.t Js.t Js.meth
  method getStoreListeners : 'a Js.t Js.meth
  method indexOf : 'a Js.t -> Js.number Js.t Js.meth
  method initComponent : unit Js.meth
  method isSelected : 'a Js.t -> bool Js.t Js.meth
  method onBindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method onDestroy : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method onUnbindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  method prepareData : 'a Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    'b Js.t Js.meth
  method refresh : unit Js.meth
  method refreshNode : Js.number Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_util_Bindable.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method blockRefresh : bool Js.t Js.prop
  method deferEmptyText : bool Js.t Js.prop
  method deferInitialRefresh : bool Js.t Js.prop
  method disableSelection : bool Js.t Js.prop
  method emptyText : Js.js_string Js.t Js.prop
  method itemCls : Js.js_string Js.t Js.prop
  method itemSelector : Js.js_string Js.t Js.prop
  method itemTpl : 'a Js.t Js.prop
  method loadMask : 'a Js.t Js.prop
  method loadingCls : Js.js_string Js.t Js.prop
  method loadingHeight : Js.number Js.t Js.prop
  method loadingText : Js.js_string Js.t Js.prop
  method overItemCls : Js.js_string Js.t Js.prop
  method preserveScrollOnRefresh : bool Js.t Js.prop
  method selectedItemCls : Js.js_string Js.t Js.prop
  method singleSelect : bool Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method tpl : 'a Js.t Js.prop
  method trackOver : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_util_Bindable.events
  
  method beforerefresh : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method itemadd : (Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    Dom_html.element Js.t Js.js_array Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method itemremove : (Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  method itemupdate : (Ext_data_Model.t Js.t -> Js.number Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method refresh : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method viewready : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_util_Bindable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.view.AbstractView"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o
