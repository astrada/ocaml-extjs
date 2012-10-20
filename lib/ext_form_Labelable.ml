class type t =
object('self)
  inherit Ext_Base.t
  
  method bodyEl : Ext_dom_Element.t Js.t Js.prop
  method errorEl : Ext_dom_Element.t Js.t Js.prop
  method isFieldLabelable : bool Js.t Js.prop
  method labelCell : Ext_dom_Element.t Js.t Js.prop
  method labelEl : Ext_dom_Element.t Js.t Js.prop
  method getActiveError : Js.js_string Js.t Js.meth
  method getActiveErrors : Js.js_string Js.t Js.js_array Js.t Js.meth
  method getFieldLabel : Js.js_string Js.t Js.meth
  method getInputId : Js.js_string Js.t Js.meth
  method getLabelableRenderData : _ Js.t Js.meth
  method getSubTplMarkup : Js.js_string Js.t Js.meth
  method hasActiveError : bool Js.t Js.meth
  method hasVisibleLabel : bool Js.t Js.meth
  method initLabelable : unit Js.meth
  method setActiveError : Js.js_string Js.t -> unit Js.meth
  method setActiveErrors : Js.js_string Js.t Js.js_array Js.t -> unit Js.meth
  method setFieldDefaults : _ Js.t -> unit Js.meth
  method setFieldLabel : Js.js_string Js.t -> unit Js.meth
  method trimLabelSeparator : Js.js_string Js.t Js.meth
  method unsetActiveError : unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method getFieldLabel : ('self Js.t, unit -> Js.js_string Js.t)
    Js.meth_callback Js.writeonly_prop
  method activeError : Js.js_string Js.t Js.prop
  method activeErrorsTpl : _ Js.t Js.prop
  method afterBodyEl : _ Js.t Js.prop
  method afterLabelTextTpl : _ Js.t Js.prop
  method afterLabelTpl : _ Js.t Js.prop
  method afterSubTpl : _ Js.t Js.prop
  method autoFitErrors : bool Js.t Js.prop
  method baseBodyCls : Js.js_string Js.t Js.prop
  method beforeBodyEl : _ Js.t Js.prop
  method beforeLabelTextTpl : _ Js.t Js.prop
  method beforeLabelTpl : _ Js.t Js.prop
  method beforeSubTpl : _ Js.t Js.prop
  method clearCls : Js.js_string Js.t Js.prop
  method errorMsgCls : Js.js_string Js.t Js.prop
  method fieldBodyCls : Js.js_string Js.t Js.prop
  method fieldLabel : Js.js_string Js.t Js.prop
  method formItemCls : Js.js_string Js.t Js.prop
  method hideEmptyLabel : bool Js.t Js.prop
  method hideLabel : bool Js.t Js.prop
  method invalidCls : Js.js_string Js.t Js.prop
  method labelAlign : Js.js_string Js.t Js.prop
  method labelAttrTpl : _ Js.t Js.prop
  method labelCls : Js.js_string Js.t Js.prop
  method labelClsExtra : Js.js_string Js.t Js.prop
  method labelPad : Js.number Js.t Js.prop
  method labelSeparator : Js.js_string Js.t Js.prop
  method labelStyle : Js.js_string Js.t Js.prop
  method labelWidth : Js.number Js.t Js.prop
  method msgTarget : Js.js_string Js.t Js.prop
  method preventMark : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  method errorchange : (t Js.t -> Js.js_string Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.form.Labelable"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

