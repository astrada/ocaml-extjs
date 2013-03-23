class type t =
object('self)
  inherit Ext_form_Labelable.t
  inherit Ext_form_field_Field.t
  inherit Ext_Component.t
  
  method clearInvalid : unit Js.meth
  method doComponentLayout_container : #Ext_container_Container.t Js.t
    Js.meth
  method getRawValue : Js.js_string Js.t Js.meth
  method getSubTplData : _ Js.t Js.meth
  method getSubmitData : _ Js.t Js.meth
  method getSubmitValue : Js.js_string Js.t Js.meth
  method getValue : _ Js.t Js.meth
  method initComponent : unit Js.meth
  method initEvents : unit Js.meth
  method initRenderData : _ Js.t Js.meth
  method isFileUpload : bool Js.t Js.meth
  method isValid : bool Js.t Js.meth
  method markInvalid : _ Js.t -> unit Js.meth
  method onDisable : unit Js.meth
  method onEnable : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method processRawValue : _ Js.t -> _ Js.t Js.meth
  method rawToValue : _ Js.t -> _ Js.t Js.meth
  method setFieldStyle : _ Js.t -> unit Js.meth
  method setRawValue : _ Js.t -> _ Js.t Js.meth
  method setReadOnly : bool Js.t -> unit Js.meth
  method setValue : _ Js.t -> 'self Js.t Js.meth
  method transformRawValue : _ Js.t -> _ Js.t Js.meth
  method validateValue : _ Js.t -> bool Js.t Js.meth
  method valueToRaw : _ Js.t -> _ Js.t Js.meth
  method inputEl : Ext_dom_Element.t Js.t Js.prop
  method maskOnDisable : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_form_Labelable.configs
  inherit Ext_form_field_Field.configs
  inherit Ext_Component.configs
  
  method getSubTplData : ('self Js.t, unit -> _ Js.t) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onEnable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method baseCls : Js.js_string Js.t Js.prop
  method checkChangeBuffer : Js.number Js.t Js.prop
  method checkChangeEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method dirtyCls : Js.js_string Js.t Js.prop
  method fieldCls : Js.js_string Js.t Js.prop
  method fieldStyle : Js.js_string Js.t Js.prop
  method focusCls : Js.js_string Js.t Js.prop
  method inputAttrTpl : _ Js.t Js.prop
  method inputId : Js.js_string Js.t Js.prop
  method inputType : Js.js_string Js.t Js.prop
  method invalidText : Js.js_string Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method readOnly : bool Js.t Js.prop
  method readOnlyCls : Js.js_string Js.t Js.prop
  method tabIndex : Js.number Js.t Js.prop
  method validateOnBlur : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_form_Labelable.events
  inherit Ext_form_field_Field.events
  inherit Ext_Component.events
  
  method specialkey : (t Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method writeablechange : (t Js.t -> bool Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Component.statics
  inherit Ext_form_Labelable.statics
  inherit Ext_form_field_Field.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.form.field.Base"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

