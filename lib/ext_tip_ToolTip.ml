class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_tip_Tip.t
  
  method triggerElement : Dom_html.element Js.t Js.prop
  method beforeDestroy : unit Js.meth
  method hide_tooltip : unit Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  method onDisable : unit Js.meth
  method onHide : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method onShow : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method setTarget : 'a Js.t -> unit Js.meth
  method show_tooltip : unit Js.meth
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  
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
  inherit Ext_tip_Tip.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onHide : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method onShow : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method anchor : Js.js_string Js.t Js.prop
  method anchorOffset : Js.number Js.t Js.prop
  method anchorToTarget : bool Js.t Js.prop
  method autoHide : bool Js.t Js.prop
  method delegate : Js.js_string Js.t Js.prop
  method dismissDelay : Js.number Js.t Js.prop
  method hideDelay : Js.number Js.t Js.prop
  method mouseOffset : Js.number Js.t Js.js_array Js.t Js.prop
  method showDelay : Js.number Js.t Js.prop
  method target : 'a Js.t Js.prop
  method trackMouse : bool Js.t Js.prop
  
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
  inherit Ext_tip_Tip.events
  
  
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
  inherit Ext_tip_Tip.statics
  
  
end

let static = Js.Unsafe.variable "Ext.tip.ToolTip"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

