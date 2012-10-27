class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method owner : #Ext_container_Container.t Js.t Js.prop
  method applyIfToFields : _ Js.t -> 'self Js.t Js.meth
  method applyToFields : _ Js.t -> 'self Js.t Js.meth
  method checkDirty : unit Js.meth
  method checkValidity : unit Js.meth
  method clearInvalid : 'self Js.t Js.meth
  method destroy : unit Js.meth
  method doAction : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method findField : Js.js_string Js.t -> #Ext_form_field_Field.t Js.t
    Js.meth
  method getFieldValues : bool Js.t Js.optdef -> _ Js.t Js.meth
  method getFields : Ext_util_MixedCollection.t Js.t Js.meth
  method getRecord : Ext_data_Model.t Js.t Js.meth
  method getValues : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method hasInvalidField : unit Js.meth
  method hasUpload : unit Js.meth
  method isDirty : unit Js.meth
  method isValid : unit Js.meth
  method load : _ Js.t -> 'self Js.t Js.meth
  method loadRecord : Ext_data_Model.t Js.t -> 'self Js.t Js.meth
  method markInvalid : _ Js.t -> 'self Js.t Js.meth
  method reset : 'self Js.t Js.meth
  method setValues : _ Js.t -> 'self Js.t Js.meth
  method submit : _ Js.t -> 'self Js.t Js.meth
  method updateRecord : Ext_data_Model.t Js.t Js.optdef -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method api : _ Js.t Js.prop
  method baseParams : _ Js.t Js.prop
  method errorReader : Ext_data_reader_Reader.t Js.t Js.prop
  method _method : Js.js_string Js.t Js.prop
  method paramOrder : _ Js.t Js.prop
  method paramsAsHash : bool Js.t Js.prop
  method reader : Ext_data_reader_Reader.t Js.t Js.prop
  method standardSubmit : bool Js.t Js.prop
  method timeout : Js.number Js.t Js.prop
  method trackResetOnLoad : bool Js.t Js.prop
  method url : Js.js_string Js.t Js.prop
  method waitMsgTarget : _ Js.t Js.prop
  method waitTitle : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method actioncomplete : (t Js.t -> Ext_form_action_Action.t Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method actionfailed : (t Js.t -> Ext_form_action_Action.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method beforeaction : (t Js.t -> Ext_form_action_Action.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method dirtychange : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method validitychange : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.form.Basic"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

