class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  
  method hasView : bool Js.t Js.prop
  method optimizedColumnMove : bool Js.t Js.prop
  method afterCollapse : bool Js.t -> unit Js.meth
  method afterExpand : bool Js.t -> unit Js.meth
  method applyState : 'a Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  method getState : 'a Js.t Js.meth
  method getStore : Ext_data_Store.t Js.t Js.meth
  method getView : Ext_view_Table.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method allowDeselect : bool Js.t Js.prop
  method columnLines : bool Js.t Js.prop
  method columns : 'a Js.t Js.prop
  method deferRowRender : bool Js.t Js.prop
  method disableSelection : bool Js.t Js.prop
  method emptyText : Js.js_string Js.t Js.prop
  method enableColumnHide : bool Js.t Js.prop
  method enableColumnMove : bool Js.t Js.prop
  method enableColumnResize : bool Js.t Js.prop
  method enableLocking : bool Js.t Js.prop
  method features : Ext_grid_feature_Feature.t Js.js_array Js.t Js.prop
  method forceFit : bool Js.t Js.prop
  method hideHeaders : bool Js.t Js.prop
  method layout_2 : Js.js_string Js.t Js.prop
  method rowLines : bool Js.t Js.prop
  method scroll : 'a Js.t Js.prop
  method sealedColumns : bool Js.t Js.prop
  method selModel : 'a Js.t Js.prop
  method selType : Js.js_string Js.t Js.prop
  method sortableColumns : bool Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method verticalScroller : 'a Js.t Js.prop
  method view : Ext_view_Table.t Js.t Js.prop
  method viewConfig : 'a Js.t Js.prop
  method viewType : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  
  method beforecontainerclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainerdblclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermousedown : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseout : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseover : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseup : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforedeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeedit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  method beforeitemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemcontextmenu : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseenter : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseleave : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method canceledit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  method cellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method celldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnhide : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> Js.number Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method columnshow : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method containerclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method containercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method containerdblclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseout : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseover : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseup : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method deselect : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t
    -> Js.number Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method edit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t ->
    unit) Js.callback Js.writeonly_prop
  method itemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemcontextmenu : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseenter : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseleave : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method select : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t ->
    Js.number Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method sortchange : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.js_string Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method validateedit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  method viewready : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  
  
end

let static = Js.Unsafe.variable "Ext.panel.Table"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

