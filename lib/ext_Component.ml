class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_util_Floating.t
  
  method floatParent : 'a Js.t Js.readonly_prop
  method zIndexManager : Ext_ZIndexManager.t Js.t Js.readonly_prop
  method zIndexParent : 'a Js.t Js.readonly_prop
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterHide : 'a Js.callback Js.optdef -> 'b Js.t Js.optdef -> unit
    Js.meth
  method afterRender_2 : unit Js.meth
  method afterSetPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  method afterShow : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method beforeShow : unit Js.meth
  method bubble : 'a Js.callback -> 'b Js.t Js.optdef ->
    'c Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  method cancelFocus : unit Js.meth
  method cloneConfig : 'a Js.t -> 'self Js.t Js.meth
  method findParentBy : 'a Js.callback -> 'b Js.t Js.meth
  method findParentByType : 'a Js.t -> 'b Js.t Js.meth
  method focus : bool Js.t Js.optdef -> 'a Js.t Js.optdef -> 'self Js.t
    Js.meth
  method getBox : bool Js.t Js.optdef -> 'a Js.t Js.meth
  method getBubbleTarget : 'a Js.t Js.meth
  method getEl : Ext_dom_Element.t Js.t Js.meth
  method getId : Js.js_string Js.t Js.meth
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  method getXType : Js.js_string Js.t Js.meth
  method hide : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'self Js.t Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  method onHide : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method onResize : unit Js.meth
  method onShow : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  method onShowComplete : 'a Js.callback Js.optdef -> 'b Js.t Js.optdef ->
    unit Js.meth
  method scrollBy : 'a Js.t -> 'b Js.t -> 'c Js.t -> unit Js.meth
  method setAutoScroll : bool Js.t -> 'self Js.t Js.meth
  method setLoading : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.meth
  method setOverflowXY : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  method setPagePosition : Js.number Js.t -> Js.number Js.t ->
    'a Js.t Js.optdef -> 'self Js.t Js.meth
  method show : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'self Js.t Js.meth
  method showAt : Js.number Js.t -> Js.number Js.t -> 'a Js.t Js.optdef ->
    unit Js.meth
  method updateBox : 'a Js.t -> 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_util_Floating.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterHide : ('self Js.t, 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method afterRender_2 : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterSetPosition : ('self Js.t, Js.number Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method afterShow : ('self Js.t, 'a Js.t Js.optdef ->
    'b Js.callback Js.optdef -> 'c Js.t Js.optdef -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeShow : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onHide : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onResize : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onShowComplete : ('self Js.t, 'a Js.callback Js.optdef ->
    'b Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method autoScroll : bool Js.t Js.prop
  method columnWidth : 'a Js.t Js.prop
  method draggable_2 : 'a Js.t Js.prop
  method floating : bool Js.t Js.prop
  method formBind : bool Js.t Js.prop
  method overflowX : Js.js_string Js.t Js.prop
  method overflowY : Js.js_string Js.t Js.prop
  method region : Js.js_string Js.t Js.prop
  method resizable : 'a Js.t Js.prop
  method resizeHandles : Js.js_string Js.t Js.prop
  method toFrontOnShow : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_util_Floating.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_util_Floating.statics
  
  
end

let static = Js.Unsafe.variable "Ext.Component"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

