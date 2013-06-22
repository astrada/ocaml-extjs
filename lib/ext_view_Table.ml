class type t =
object('self)
  inherit Ext_view_View.t
  
  method addRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method autoSizeColumn : _ Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    _ Js.t Js.js_array Js.t Js.meth
  method focus_table : bool Js.t Js.optdef -> _ Js.t Js.optdef ->
    _ Js.callback Js.optdef -> _ Js.callback Js.optdef ->
    #Ext_Component.t Js.t Js.meth
  method focusRow : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  method getBodySelector : unit Js.meth
  method getCellSelector : Ext_grid_column_Column.t Js.t Js.optdef -> unit
    Js.meth
  method getColumnSizerSelector : _ Js.t -> unit Js.meth
  method getDataRowSelector : unit Js.meth
  method getFeature : Js.js_string Js.t -> Ext_grid_feature_Feature.t Js.t
    Js.meth
  method getItemSelector : unit Js.meth
  method getNode_table : _ Js.t -> bool Js.t Js.optdef ->
    Dom_html.element Js.t Js.meth
  method getNodeContainerSelector : unit Js.meth
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  method getRecord : _ Js.t -> Ext_data_Model.t Js.t Js.meth
  method getRowClass : Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t ->
    Ext_data_Store.t Js.t -> Js.js_string Js.t Js.meth
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  method refresh : unit Js.meth
  method removeRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method walkRecs : Ext_data_Model.t Js.t -> Js.number Js.t -> unit Js.meth
  method walkRows : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_view_View.configs
  
  method baseCls : Js.js_string Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method enableTextSelection : bool Js.t Js.prop
  method firstCls : Js.js_string Js.t Js.prop
  method itemSelector : Js.js_string Js.t Js.prop
  method lastCls : Js.js_string Js.t Js.prop
  method markDirty : bool Js.t Js.prop
  method overItemCls : Js.js_string Js.t Js.prop
  method selectedItemCls : Js.js_string Js.t Js.prop
  method stripeRows : bool Js.t Js.prop
  method trackOver : bool Js.t Js.prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_view_View.events
  
  method beforecellclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecellcontextmenu : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecelldblclick : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellkeydown : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellmousedown : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellmouseup : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method cellcontextmenu : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method celldblclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method cellkeydown : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method cellmousedown : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method cellmouseup : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_view_View.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.view.Table"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

