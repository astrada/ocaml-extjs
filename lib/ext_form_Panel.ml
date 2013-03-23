class type t =
object('self)
  inherit Ext_form_FieldAncestor.t
  inherit Ext_panel_Panel.t
  
  method checkChange : unit Js.meth
  method getForm : Ext_form_Basic.t Js.t Js.meth
  method getRecord : Ext_data_Model.t Js.t Js.meth
  method getValues : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method hasInvalidField : unit Js.meth
  method initComponent : unit Js.meth
  method isDirty : bool Js.t Js.meth
  method isValid : bool Js.t Js.meth
  method load : _ Js.t -> unit Js.meth
  method loadRecord : Ext_data_Model.t Js.t -> Ext_form_Basic.t Js.t Js.meth
  method startPolling : Js.number Js.t -> unit Js.meth
  method stopPolling : unit Js.meth
  method submit : _ Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_form_FieldAncestor.configs
  inherit Ext_panel_Panel.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method layout_str : _ Js.t Js.prop
  method pollForChanges : bool Js.t Js.prop
  method pollInterval : Js.number Js.t Js.prop
  
end

class type events =
object
  inherit Ext_form_FieldAncestor.events
  inherit Ext_panel_Panel.events
  
  method actioncomplete : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method actionfailed : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeaction : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dirtychange : (Ext_form_Basic.t Js.t -> bool Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method validitychange : (Ext_form_Basic.t Js.t -> bool Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  inherit Ext_form_FieldAncestor.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.form.Panel"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

