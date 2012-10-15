class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  
  method initComponent : unit Js.meth
  method showAt_arr : Js.number Js.t Js.js_array Js.t -> unit Js.meth
  method showBy : 'a Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  
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
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method autoRender_bool : bool Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method closable : bool Js.t Js.prop
  method closeAction : Js.js_string Js.t Js.prop
  method constrainPosition : bool Js.t Js.prop
  method defaultAlign : Js.js_string Js.t Js.prop
  method floating_obj : 'a Js.t Js.prop
  method focusOnToFront : bool Js.t Js.prop
  method frameHeader : bool Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method maxWidth : Js.number Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method shadow : 'a Js.t Js.prop
  method width : Js.number Js.t Js.prop
  
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

let static = Js.Unsafe.variable "Ext.tip.Tip"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

