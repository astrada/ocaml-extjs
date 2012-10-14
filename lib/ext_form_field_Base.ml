class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_form_Labelable.t
  inherit Ext_form_field_Field.t
  
  method inputEl : Ext_dom_Element.t Js.t Js.prop
  method maskOnDisable : bool Js.t Js.prop
  method clearInvalid : unit Js.meth
  method doComponentLayout_container : #Ext_container_Container.t Js.t
    Js.meth
  method extractFileInput : Dom_html.element Js.t Js.meth
  method getRawValue : Js.js_string Js.t Js.meth
  method getSubTplData : 'a Js.t Js.meth
  method getSubmitData : 'a Js.t Js.meth
  method getSubmitValue : Js.js_string Js.t Js.meth
  method getValue : 'a Js.t Js.meth
  method initComponent : unit Js.meth
  method isFileUpload : bool Js.t Js.meth
  method isValid : bool Js.t Js.meth
  method markInvalid : 'a Js.t -> unit Js.meth
  method onDisable : unit Js.meth
  method onEnable : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method processRawValue : 'a Js.t -> 'b Js.t Js.meth
  method rawToValue : 'a Js.t -> 'b Js.t Js.meth
  method setFieldStyle : 'a Js.t -> unit Js.meth
  method setRawValue : 'a Js.t -> 'b Js.t Js.meth
  method setReadOnly : bool Js.t -> unit Js.meth
  method setValue : 'a Js.t -> 'self Js.t Js.meth
  method transformRawValue : 'a Js.t -> 'b Js.t Js.meth
  method validateValue : 'a Js.t -> bool Js.t Js.meth
  method valueToRaw : 'a Js.t -> 'b Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_form_Labelable.configs
  inherit Ext_form_field_Field.configs
  
  method getSubTplData : ('self Js.t, unit -> 'a Js.t) Js.meth_callback
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
  method componentLayout_str : Js.js_string Js.t Js.prop
  method dirtyCls : Js.js_string Js.t Js.prop
  method fieldCls : Js.js_string Js.t Js.prop
  method fieldStyle : Js.js_string Js.t Js.prop
  method focusCls : Js.js_string Js.t Js.prop
  method inputAttrTpl : 'a Js.t Js.prop
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
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_form_Labelable.events
  inherit Ext_form_field_Field.events
  
  method specialkey : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method writeablechange : (t Js.t -> bool Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_form_Labelable.statics
  inherit Ext_form_field_Field.statics
  
  
end

let static = Js.Unsafe.variable "Ext.form.field.Base"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

