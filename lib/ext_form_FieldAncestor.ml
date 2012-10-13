class type t =
object('self)
  inherit Ext_Base.t
  
  method initFieldAncestor : unit Js.meth
  method onFieldAdded : Ext_form_field_Field.t Js.t -> unit Js.meth
  method onFieldErrorChange : Ext_form_Labelable.t Js.t -> Js.js_string Js.t
    -> unit Js.meth
  method onFieldRemoved : Ext_form_field_Field.t Js.t -> unit Js.meth
  method onFieldValidityChange : Ext_form_field_Field.t Js.t -> bool Js.t ->
    unit Js.meth
  method onLabelableAdded : Ext_form_Labelable.t Js.t -> unit Js.meth
  method onLabelableRemoved : Ext_form_Labelable.t Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method fieldDefaults : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  method fielderrorchange : (t Js.t -> Ext_form_Labelable.t Js.t ->
    Js.js_string Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method fieldvaliditychange : (t Js.t -> Ext_form_Labelable.t Js.t ->
    Js.js_string Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.form.FieldAncestor"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

