class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_form_FieldAncestor.t
  
  method beforeDestroy : unit Js.meth
  method checkChange : unit Js.meth
  method getForm : Ext_form_Basic.t Js.t Js.meth
  method getRecord : Ext_data_Model.t Js.t Js.meth
  method getValues : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  method initComponent : unit Js.meth
  method load : 'a Js.t -> unit Js.meth
  method loadRecord : Ext_data_Model.t Js.t -> Ext_form_Basic.t Js.t Js.meth
  method startPolling : Js.number Js.t -> unit Js.meth
  method stopPolling : unit Js.meth
  method submit : 'a Js.t -> unit Js.meth
  
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
  inherit Ext_form_FieldAncestor.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method layout_str : Js.js_string Js.t Js.prop
  method pollForChanges : bool Js.t Js.prop
  method pollInterval : Js.number Js.t Js.prop
  
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
  inherit Ext_form_FieldAncestor.events
  
  method actioncomplete : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method actionfailed : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeaction : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dirtychange : (Ext_form_Basic.t Js.t -> bool Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  method validitychange : (Ext_form_Basic.t Js.t -> bool Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  
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
  inherit Ext_form_FieldAncestor.statics
  
  
end

let static = Js.Unsafe.variable "Ext.form.Panel"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

