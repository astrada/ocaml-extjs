class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_state_Stateful.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Renderable.t
  inherit Ext_util_ElementContainer.t
  inherit Ext_util_Animate.t
  
  method _isLayoutRoot : bool Js.t Js.prop
  method draggable : bool Js.t Js.readonly_prop
  method frameSize : 'a Js.t Js.readonly_prop
  method isComponent : bool Js.t Js.prop
  method maskOnDisable : bool Js.t Js.prop
  method ownerCt : 'a Js.t Js.readonly_prop
  method rendered : bool Js.t Js.readonly_prop
  method addCls : 'a Js.t -> 'self Js.t Js.meth
  method addClsWithUI : 'a Js.t -> 'b Js.t -> unit Js.meth
  method addListener : 'a Js.t -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'd Js.t Js.optdef -> unit Js.meth
  method addPropertyToState : 'a Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.meth
  method addUIClsToElement : Js.js_string Js.t -> unit Js.meth
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterSetPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method animate : 'a Js.t -> 'b Js.t Js.meth
  method beforeComponentLayout : Js.number Js.t -> Js.number Js.t -> unit
    Js.meth
  method beforeDestroy : unit Js.meth
  method destroy : unit Js.meth
  method disable : bool Js.t Js.optdef -> unit Js.meth
  method doComponentLayout : 'a Js.t Js.meth
  method enable : bool Js.t Js.optdef -> unit Js.meth
  method getBubbleTarget : 'a Js.t Js.meth
  method getEl : Ext_dom_Element.t Js.t Js.meth
  method getHeight : Js.number Js.t Js.meth
  method getId : Js.js_string Js.t Js.meth
  method getItemId : Js.js_string Js.t Js.meth
  method getLoader : Ext_ComponentLoader.t Js.t Js.meth
  method getPlugin : Js.js_string Js.t -> Ext_AbstractPlugin.t Js.t Js.meth
  method getSize : 'a Js.t Js.meth
  method getSizeModel : 'a Js.t -> 'b Js.t Js.meth
  method getState : 'a Js.t Js.meth
  method getWidth : Js.number Js.t Js.meth
  method getXTypes : Js.js_string Js.t Js.meth
  method hasCls : Js.js_string Js.t -> bool Js.t Js.meth
  method hasUICls : Js.js_string Js.t -> unit Js.meth
  method is : Js.js_string Js.t -> bool Js.t Js.meth
  method isDescendantOf : 'a Js.t -> bool Js.t Js.meth
  method isDisabled : bool Js.t Js.meth
  method isDraggable : bool Js.t Js.meth
  method isDroppable : bool Js.t Js.meth
  method isFloating : bool Js.t Js.meth
  method isHidden : bool Js.t Js.meth
  method isLayoutRoot : unit Js.meth
  method isLayoutSuspended : bool Js.t Js.meth
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  method isXType : Js.js_string Js.t -> bool Js.t Js.optdef -> bool Js.t
    Js.meth
  method nextNode : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method nextSibling : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method onAdded : 'a Js.t -> Js.number Js.t -> unit Js.meth
  method onDisable : unit Js.meth
  method onEnable : unit Js.meth
  method onPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method onRemoved : bool Js.t -> unit Js.meth
  method onResize : unit Js.meth
  method previousNode : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method previousSibling : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method registerFloatingItem : 'a Js.t -> unit Js.meth
  method removeCls : 'a Js.t -> 'self Js.t Js.meth
  method removeClsWithUI : 'a Js.t -> unit Js.meth
  method removeUIClsFromElement : Js.js_string Js.t -> unit Js.meth
  method setBorder : 'a Js.t -> unit Js.meth
  method setDisabled : bool Js.t -> unit Js.meth
  method setDocked : 'a Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method setHeight : Js.number Js.t -> 'self Js.t Js.meth
  method setPosition : Js.number Js.t -> Js.number Js.t -> 'a Js.t Js.optdef
    -> 'self Js.t Js.meth
  method setSize : 'a Js.t -> 'b Js.t -> 'self Js.t Js.meth
  method setUI : Js.js_string Js.t -> unit Js.meth
  method setVisible : bool Js.t -> 'self Js.t Js.meth
  method setWidth : Js.number Js.t -> 'self Js.t Js.meth
  method up : Js.js_string Js.t Js.optdef -> 'a Js.t Js.meth
  method update : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> unit Js.meth
  method updateLayout : 'a Js.t -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_state_Stateful.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Renderable.configs
  inherit Ext_util_ElementContainer.configs
  inherit Ext_util_Animate.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterSetPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method beforeComponentLayout : ('self Js.t, Js.number Js.t ->
    Js.number Js.t -> unit) Js.meth_callback Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onAdded : ('self Js.t, 'a Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onEnable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  method onRemoved : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method onResize : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method autoEl : 'a Js.t Js.prop
  method autoRender : 'a Js.t Js.prop
  method autoShow : bool Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method border : 'a Js.t Js.prop
  method childEls : 'a Js.t Js.js_array Js.t Js.prop
  method cls : Js.js_string Js.t Js.prop
  method componentCls : Js.js_string Js.t Js.prop
  method componentLayout : 'a Js.t Js.prop
  method contentEl : Js.js_string Js.t Js.prop
  method data : 'a Js.t Js.prop
  method disabled : bool Js.t Js.prop
  method disabledCls : Js.js_string Js.t Js.prop
  method draggable : bool Js.t Js.prop
  method floating : bool Js.t Js.prop
  method frame : bool Js.t Js.prop
  method height : Js.number Js.t Js.prop
  method hidden : bool Js.t Js.prop
  method hideMode : Js.js_string Js.t Js.prop
  method html : 'a Js.t Js.prop
  method id : Js.js_string Js.t Js.prop
  method itemId : Js.js_string Js.t Js.prop
  method loader : 'a Js.t Js.prop
  method margin : 'a Js.t Js.prop
  method maxHeight : Js.number Js.t Js.prop
  method maxWidth : Js.number Js.t Js.prop
  method minHeight : Js.number Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method overCls : Js.js_string Js.t Js.prop
  method padding : 'a Js.t Js.prop
  method plugins : 'a Js.t Js.prop
  method renderData : 'a Js.t Js.prop
  method renderSelectors : 'a Js.t Js.prop
  method renderTo : 'a Js.t Js.prop
  method renderTpl : 'a Js.t Js.prop
  method shrinkWrap : 'a Js.t Js.prop
  method style : 'a Js.t Js.prop
  method styleHtmlCls : Js.js_string Js.t Js.prop
  method styleHtmlContent : bool Js.t Js.prop
  method tpl : 'a Js.t Js.prop
  method tplWriteMode : Js.js_string Js.t Js.prop
  method ui : Js.js_string Js.t Js.prop
  method width : Js.number Js.t Js.prop
  method xtype : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_state_Stateful.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Renderable.events
  inherit Ext_util_ElementContainer.events
  inherit Ext_util_Animate.events
  
  method activate : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method added : (t Js.t -> 'a Js.t -> Js.number Js.t -> 'b Js.t -> unit)
    Js.callback Js.writeonly_prop
  method afterrender : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeactivate : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforedeactivate : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforedestroy : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforehide : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforerender : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforeshow : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method blur : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method boxready : (t Js.t -> Js.number Js.t -> Js.number Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  method deactivate : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method destroy : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method disable : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method enable : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method focus : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method hide : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method move : (t Js.t -> Js.number Js.t -> Js.number Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  method removed : (t Js.t -> 'a Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  method render : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method resize : (t Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method show : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_state_Stateful.statics
  inherit Ext_util_Observable.statics
  inherit Ext_util_Renderable.statics
  inherit Ext_util_ElementContainer.statics
  inherit Ext_util_Animate.statics
  
  method cancelLayout : 'self Js.t -> unit Js.meth
  method flushLayouts : unit Js.meth
  method resumeLayouts : bool Js.t Js.optdef -> unit Js.meth
  method suspendLayouts : unit Js.meth
  method updateLayout : 'self Js.t -> bool Js.t Js.optdef -> unit Js.meth
  
end

let static = Js.Unsafe.variable "Ext.AbstractComponent"

let cancelLayout comp =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "cancelLayout")
    [|Js.Unsafe.inject comp; |]

let flushLayouts () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "flushLayouts") [||]

let resumeLayouts flush =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "resumeLayouts")
    [|Js.Unsafe.inject flush; |]

let suspendLayouts () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "suspendLayouts") [||]

let updateLayout comp defer =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "updateLayout")
    [|Js.Unsafe.inject comp; Js.Unsafe.inject defer; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

