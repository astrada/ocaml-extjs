class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  
  method dd_2 : Ext_util_ComponentDragger.t Js.t Js.prop
  method isWindow : bool Js.t Js.prop
  method afterCollapse : bool Js.t -> unit Js.meth
  method afterExpand : bool Js.t -> unit Js.meth
  method afterHide : 'a Js.callback Js.optdef -> 'b Js.t Js.optdef -> unit
    Js.meth
  method afterRender : unit Js.meth
  method applyState : 'a Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method beforeLayout : unit Js.meth
  method getDefaultFocus : unit Js.meth
  method getState : 'a Js.t Js.meth
  method initComponent : unit Js.meth
  method maximize : 'self Js.t Js.meth
  method minimize : 'self Js.t Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method onShow : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method restore : 'self Js.t Js.meth
  method toggleMaximize : 'self Js.t Js.meth
  
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
  method afterHide : ('self Js.t, 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeLayout : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onShow : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method animateTarget : 'a Js.t Js.prop
  method autoRender_2 : bool Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method closable : bool Js.t Js.prop
  method collapsed : bool Js.t Js.prop
  method collapsible : bool Js.t Js.prop
  method constrain : bool Js.t Js.prop
  method constrainHeader : bool Js.t Js.prop
  method constrainTo : 'a Js.t Js.prop
  method defaultFocus : 'a Js.t Js.prop
  method draggable : bool Js.t Js.prop
  method expandOnShow : bool Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method maximizable : bool Js.t Js.prop
  method maximized : bool Js.t Js.prop
  method minHeight : Js.number Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method minimizable : bool Js.t Js.prop
  method modal : bool Js.t Js.prop
  method onEsc : 'a Js.callback Js.prop
  method overlapHeader : bool Js.t Js.prop
  method plain : bool Js.t Js.prop
  method resizable : 'a Js.t Js.prop
  method x : Js.number Js.t Js.prop
  method y : Js.number Js.t Js.prop
  
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
  
  method activate_2 : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method deactivate_2 : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method maximize : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method minimize : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method resize_2 : (t Js.t -> Js.number Js.t -> Js.number Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  method restore : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  
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

let static = Js.Unsafe.variable "Ext.window.Window"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

