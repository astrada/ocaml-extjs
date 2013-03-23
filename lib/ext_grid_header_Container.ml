class type t =
object('self)
  inherit Ext_container_Container.t
  
  method getColumnCount : unit Js.meth
  method getColumnMenu : _ Js.t -> unit Js.meth
  method getFullWidth : unit Js.meth
  method getGridColumns : _ Js.t -> _ Js.t -> _ Js.js_array Js.t Js.meth
  method getHeaderAtIndex : Js.number Js.t -> unit Js.meth
  method getHeaderIndex : 'self Js.t -> Js.number Js.t Js.meth
  method getMenuItems : _ Js.js_array Js.t Js.meth
  method getVisibleGridColumns : _ Js.js_array Js.t Js.meth
  method getVisibleHeaderClosestToIndex : Js.number Js.t -> unit Js.meth
  method initComponent : unit Js.meth
  method isLayoutRoot : unit Js.meth
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  method onDestroy : unit Js.meth
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method isGroupHeader : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_container_Container.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onAdd : ('self Js.t, #Ext_Component.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRemove : ('self Js.t, #Ext_Component.t Js.t -> bool Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method baseCls : Js.js_string Js.t Js.prop
  method border : _ Js.t Js.prop
  method defaultType : Js.js_string Js.t Js.prop
  method defaultWidth : Js.number Js.t Js.prop
  method detachOnRemove : bool Js.t Js.prop
  method enableColumnHide : bool Js.t Js.prop
  method sealed : bool Js.t Js.prop
  method sortable : bool Js.t Js.prop
  method weight : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_container_Container.events
  
  method columnhide : (t Js.t -> t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (t Js.t -> t Js.t -> Js.number Js.t -> Js.number Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (t Js.t -> t Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method columnschanged : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnshow : (t Js.t -> t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method headerclick : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headercontextmenu : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headertriggerclick : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method menucreate : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method sortchange : (t Js.t -> t Js.t -> Js.js_string Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.header.Container"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

