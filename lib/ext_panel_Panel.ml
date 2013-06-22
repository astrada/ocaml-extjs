class type t =
object('self)
  inherit Ext_panel_AbstractPanel.t
  
  method dd : _ Js.t Js.prop
  method addTool : _ Js.t -> unit Js.meth
  method afterCollapse : bool Js.t -> unit Js.meth
  method afterExpand : bool Js.t -> unit Js.meth
  method beforeDestroy : unit Js.meth
  method close : unit Js.meth
  method collapse : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  method convertCollapseDir : _ Js.t -> unit Js.meth
  method expand : bool Js.t Js.optdef -> 'self Js.t Js.meth
  method getCollapsed : _ Js.t Js.meth
  method getHeader : unit Js.meth
  method getState : _ Js.t Js.meth
  method isLayoutRoot : unit Js.meth
  method isVisible : bool Js.t Js.optdef -> bool Js.t Js.meth
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method onRemoved : bool Js.t -> unit Js.meth
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method setBorder : _ Js.t -> unit Js.meth
  method setGlyph : _ Js.t -> unit Js.meth
  method setIcon : Js.js_string Js.t -> unit Js.meth
  method setIconCls : Js.js_string Js.t -> unit Js.meth
  method setTitle : Js.js_string Js.t -> unit Js.meth
  method setUI : Js.js_string Js.t -> unit Js.meth
  method toggleCollapse : 'self Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_panel_AbstractPanel.configs
  
  method animCollapse : bool Js.t Js.prop
  method bbar : _ Js.t Js.prop
  method buttonAlign : Js.js_string Js.t Js.prop
  method buttons : _ Js.t Js.prop
  method closable : bool Js.t Js.prop
  method closeAction : Js.js_string Js.t Js.prop
  method collapseDirection : Js.js_string Js.t Js.prop
  method collapseFirst : bool Js.t Js.prop
  method collapseMode : Js.js_string Js.t Js.prop
  method collapsed : bool Js.t Js.prop
  method collapsedCls : Js.js_string Js.t Js.prop
  method collapsible : bool Js.t Js.prop
  method constrain : bool Js.t Js.prop
  method constrainHeader : bool Js.t Js.prop
  method dockedItems : _ Js.t Js.prop
  method fbar : _ Js.t Js.prop
  method floatable : bool Js.t Js.prop
  method frame : bool Js.t Js.prop
  method frameHeader : bool Js.t Js.prop
  method glyph : _ Js.t Js.prop
  method header : _ Js.t Js.prop
  method headerOverCls : Js.js_string Js.t Js.prop
  method headerPosition : Js.js_string Js.t Js.prop
  method hideCollapseTool : bool Js.t Js.prop
  method icon : Js.js_string Js.t Js.prop
  method iconCls : Js.js_string Js.t Js.prop
  method lbar : _ Js.t Js.prop
  method manageHeight : bool Js.t Js.prop
  method minButtonWidth : Js.number Js.t Js.prop
  method overlapHeader : bool Js.t Js.prop
  method placeholder : _ Js.t Js.prop
  method placeholderCollapseHideMode : Js.number Js.t Js.prop
  method rbar : _ Js.t Js.prop
  method simpleDrag : bool Js.t Js.prop
  method tbar : _ Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method titleAlign : Js.js_string Js.t Js.prop
  method titleCollapse : bool Js.t Js.prop
  method tools : _ Js.t Js.prop
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  method onRemoved : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  
end

class type events =
object
  inherit Ext_panel_AbstractPanel.events
  
  method beforeclose : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method beforecollapse : (t Js.t -> Js.js_string Js.t -> bool Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  method beforeexpand : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method close : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method collapse : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method expand : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method float : (_ Js.t -> unit) Js.callback Js.writeonly_prop
  method glyphchange : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method iconchange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method iconclschange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method titlechange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method unfloat : (_ Js.t -> unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_panel_AbstractPanel.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.panel.Panel"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

