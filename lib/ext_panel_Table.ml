class type t =
object('self)
  inherit Ext_panel_Panel.t
  inherit Ext_grid_locking_Lockable.t
  
  method hasView : bool Js.t Js.prop
  method optimizedColumnMove : bool Js.t Js.prop
  method afterCollapse : bool Js.t -> unit Js.meth
  method afterExpand : bool Js.t -> unit Js.meth
  method applyState : _ Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  method getState : _ Js.t Js.meth
  method getStore : Ext_data_Store.t Js.t Js.meth
  method getView : Ext_view_Table.t Js.t Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_panel_Panel.configs
  inherit Ext_grid_locking_Lockable.configs
  
  method allowDeselect : bool Js.t Js.prop
  method columnLines : bool Js.t Js.prop
  method columns : _ Js.t Js.prop
  method deferRowRender : bool Js.t Js.prop
  method disableSelection : bool Js.t Js.prop
  method emptyText : Js.js_string Js.t Js.prop
  method enableColumnHide : bool Js.t Js.prop
  method enableColumnMove : bool Js.t Js.prop
  method enableColumnResize : bool Js.t Js.prop
  method enableLocking : bool Js.t Js.prop
  method features : _ Js.t Js.prop
  method forceFit : bool Js.t Js.prop
  method hideHeaders : bool Js.t Js.prop
  method layout : _ Js.t Js.prop
  method rowLines : bool Js.t Js.prop
  method scroll : _ Js.t Js.prop
  method sealedColumns : bool Js.t Js.prop
  method selModel : _ Js.t Js.prop
  method selType : Js.js_string Js.t Js.prop
  method sortableColumns : bool Js.t Js.prop
  method store : Ext_data_Store.t Js.t Js.prop
  method verticalScroller : _ Js.t Js.prop
  method view : Ext_view_Table.t Js.t Js.prop
  method viewConfig : _ Js.t Js.prop
  method viewType : Js.js_string Js.t Js.prop
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_panel_Panel.events
  inherit Ext_grid_locking_Lockable.events
  
  method beforecellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellcontextmenu : (Ext_view_Table.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecelldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellkeydown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecellmousedown : (Ext_view_Table.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecellmouseup : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecontainerclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainerdblclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermousedown : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseout : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseover : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforecontainermouseup : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforedeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeitemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemcontextmenu : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseenter : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseleave : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeitemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method beforeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellcontextmenu : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method celldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellkeydown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellmousedown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method cellmouseup : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnhide : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method columnschanged : (Ext_grid_header_Container.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method columnshow : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method containerclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containerdblclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseout : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseover : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method containermouseup : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method deselect : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t
    -> Js.number Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method filterchange : (Ext_data_Store.t Js.t ->
    Ext_util_Filter.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method headerclick : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headercontextmenu : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headertriggerclick : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemcontextmenu : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseenter : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseleave : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method select : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t ->
    Js.number Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method sortchange : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.js_string Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method viewready : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  inherit Ext_grid_locking_Lockable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.panel.Table"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

