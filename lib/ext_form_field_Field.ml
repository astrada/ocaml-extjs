class type t =
object('self)
  inherit Ext_Base.t
  
  method isFormField : bool Js.t Js.prop
  method originalValue : 'a Js.t Js.prop
  method batchChanges : 'a Js.t -> unit Js.meth
  method beforeReset : unit Js.meth
  method checkChange : unit Js.meth
  method checkDirty : unit Js.meth
  method clearInvalid : unit Js.meth
  method extractFileInput : Dom_html.element Js.t Js.meth
  method getErrors : 'a Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  method getModelData : 'a Js.t Js.meth
  method getName : Js.js_string Js.t Js.meth
  method getSubmitData : 'a Js.t Js.meth
  method getValue : 'a Js.t Js.meth
  method initField : unit Js.meth
  method initValue : unit Js.meth
  method isDirty : bool Js.t Js.meth
  method isEqual : 'a Js.t -> 'b Js.t -> bool Js.t Js.meth
  method isFileUpload : bool Js.t Js.meth
  method isValid : bool Js.t Js.meth
  method markInvalid : 'a Js.t -> unit Js.meth
  method reset : unit Js.meth
  method resetOriginalValue : unit Js.meth
  method setValue : 'a Js.t -> 'self Js.t Js.meth
  method transformOriginalValue : 'a Js.t -> 'b Js.t Js.meth
  method validate : bool Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method disabled : bool Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method submitValue : bool Js.t Js.prop
  method validateOnChange : bool Js.t Js.prop
  method value : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  method change : (t Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t -> unit)
    Js.callback Js.writeonly_prop
  method dirtychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method validitychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.form.field.Field"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o
