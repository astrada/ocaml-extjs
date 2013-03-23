class type t =
object('self)
  inherit Ext_grid_header_Container.t
  
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t -> _ Js.t ->
    _ Js.t -> unit Js.meth
  method afterRender : unit Js.meth
  method autoSize : _ Js.t -> unit Js.meth
  method defaultRenderer : unit Js.meth
  method getEditor : _ Js.t -> _ Js.t -> #Ext_form_field_Field.t Js.t Js.meth
  method getIndex : Js.number Js.t Js.meth
  method getSortParam : Js.js_string Js.t Js.meth
  method getVisibleIndex : Js.number Js.t Js.meth
  method hide_column : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method initComponent : unit Js.meth
  method initRenderData : _ Js.t Js.meth
  method isHideable : unit Js.meth
  method isLockable : unit Js.meth
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  method onDestroy : unit Js.meth
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  method setEditor : _ Js.t -> unit Js.meth
  method setText : Js.js_string Js.t -> unit Js.meth
  method show_column : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method isHeader : bool Js.t Js.prop
  method textEl : Ext_dom_Element.t Js.t Js.prop
  method triggerEl : Ext_dom_Element.t Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_grid_header_Container.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> _ Js.t -> _ Js.t -> unit) Js.meth_callback Js.writeonly_prop
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method defaultRenderer : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onAdd : ('self Js.t, #Ext_Component.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRemove : ('self Js.t, #Ext_Component.t Js.t -> bool Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method align : Js.js_string Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method columns : _ Js.t Js.js_array Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method dataIndex : Js.js_string Js.t Js.prop
  method detachOnRemove : bool Js.t Js.prop
  method draggable : bool Js.t Js.prop
  method editRenderer : _ Js.callback Js.prop
  method editor : _ Js.t Js.prop
  method emptyCellText : Js.js_string Js.t Js.prop
  method groupable : bool Js.t Js.prop
  method hideable : bool Js.t Js.prop
  method lockable : bool Js.t Js.prop
  method locked : bool Js.t Js.prop
  method menuDisabled : bool Js.t Js.prop
  method menuText : Js.js_string Js.t Js.prop
  method renderTpl : _ Js.t Js.prop
  method renderer : _ Js.t Js.prop
  method resizable_bool : bool Js.t Js.prop
  method scope : _ Js.t Js.prop
  method sortable : bool Js.t Js.prop
  method stateId : Js.js_string Js.t Js.prop
  method tdCls : Js.js_string Js.t Js.prop
  method text : Js.js_string Js.t Js.prop
  method tooltip : Js.js_string Js.t Js.prop
  method tooltipType : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_grid_header_Container.events
  
  
end

class type statics =
object
  inherit Ext_grid_header_Container.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.grid.column.Column"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

