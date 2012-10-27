class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_form_field_Base.t
  
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterRender : unit Js.meth
  method applyState : _ Js.t -> unit Js.meth
  method autoSize : unit Js.meth
  method getErrors : _ Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  method getRawValue : Js.js_string Js.t Js.meth
  method getState : _ Js.t Js.meth
  method getSubTplData : _ Js.t Js.meth
  method initComponent : unit Js.meth
  method onDisable : unit Js.meth
  method onEnable : unit Js.meth
  method processRawValue_str : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method reset : unit Js.meth
  method selectText : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    unit Js.meth
  method setValue : _ Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_form_field_Base.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method getSubTplData : ('self Js.t, unit -> _ Js.t) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onEnable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method allowBlank : bool Js.t Js.prop
  method blankText : Js.js_string Js.t Js.prop
  method disableKeyFilter : bool Js.t Js.prop
  method emptyCls : Js.js_string Js.t Js.prop
  method emptyText : Js.js_string Js.t Js.prop
  method enableKeyEvents : bool Js.t Js.prop
  method enforceMaxLength : bool Js.t Js.prop
  method grow : bool Js.t Js.prop
  method growAppend : Js.js_string Js.t Js.prop
  method growMax : Js.number Js.t Js.prop
  method growMin : Js.number Js.t Js.prop
  method maskRe : Regexp.regexp Js.t Js.prop
  method maxLength : Js.number Js.t Js.prop
  method maxLengthText : Js.js_string Js.t Js.prop
  method minLength : Js.number Js.t Js.prop
  method minLengthText : Js.js_string Js.t Js.prop
  method regex : Regexp.regexp Js.t Js.prop
  method regexText : Js.js_string Js.t Js.prop
  method requiredCls : Js.js_string Js.t Js.prop
  method selectOnFocus : bool Js.t Js.prop
  method size : Js.number Js.t Js.prop
  method stripCharsRe : Regexp.regexp Js.t Js.prop
  method validator : _ Js.callback Js.prop
  method vtype : Js.js_string Js.t Js.prop
  method vtypeText : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_form_field_Base.events
  
  method autosize : (t Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method keydown : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method keypress : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method keyup : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_form_field_Base.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.form.field.Text"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

