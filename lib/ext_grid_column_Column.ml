class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_grid_header_Container.t
  
  method isHeader : bool Js.t Js.prop
  method textEl : Ext_dom_Element.t Js.t Js.prop
  method triggerEl : Ext_dom_Element.t Js.t Js.prop
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterRender : unit Js.meth
  method defaultRenderer : unit Js.meth
  method getEditor : 'a Js.t -> 'b Js.t -> Ext_form_field_Field.t Js.t
    Js.meth
  method getIndex : Js.number Js.t Js.meth
  method getSortParam : Js.js_string Js.t Js.meth
  method getVisibleIndex : Js.number Js.t Js.meth
  method hide_column : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  method initComponent : unit Js.meth
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  method onDestroy : unit Js.meth
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  method setEditor : 'a Js.t -> unit Js.meth
  method setText : Js.js_string Js.t -> unit Js.meth
  method show_column : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_grid_header_Container.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
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
  method columns : 'a Js.t Js.js_array Js.t Js.prop
  method componentLayout_str : Js.js_string Js.t Js.prop
  method dataIndex : Js.js_string Js.t Js.prop
  method draggable : bool Js.t Js.prop
  method editRenderer : 'a Js.callback Js.prop
  method editor : 'a Js.t Js.prop
  method emptyCellText : Js.js_string Js.t Js.prop
  method groupable : bool Js.t Js.prop
  method hideable : bool Js.t Js.prop
  method locked : bool Js.t Js.prop
  method menuDisabled : bool Js.t Js.prop
  method menuText : Js.js_string Js.t Js.prop
  method renderTpl_str : Js.js_string Js.t Js.prop
  method renderer : 'a Js.t Js.prop
  method resizable_bool : bool Js.t Js.prop
  method scope : 'a Js.t Js.prop
  method sortable : bool Js.t Js.prop
  method stateId : Js.js_string Js.t Js.prop
  method tdCls : Js.js_string Js.t Js.prop
  method text : Js.js_string Js.t Js.prop
  method tooltip : Js.js_string Js.t Js.prop
  method tooltipType : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_grid_header_Container.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_grid_header_Container.statics
  
  
end

let static = Js.Unsafe.variable "Ext.grid.column.Column"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

