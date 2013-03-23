class type t =
object('self)
  inherit Ext_Component.t
  
  method disable : bool Js.t Js.optdef -> unit Js.meth
  method enable : bool Js.t Js.optdef -> unit Js.meth
  method getTemplateArgs : _ Js.t Js.meth
  method getText : Js.js_string Js.t Js.meth
  method hasVisibleMenu : bool Js.t Js.meth
  method hideMenu : 'self Js.t Js.meth
  method initComponent : unit Js.meth
  method onDisable : unit Js.meth
  method setGlyph : _ Js.t -> 'self Js.t Js.meth
  method setHandler : _ Js.callback -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method setHref : Js.js_string Js.t -> unit Js.meth
  method setIcon : Js.js_string Js.t -> 'self Js.t Js.meth
  method setIconCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method setParams : _ Js.t -> unit Js.meth
  method setScale : Js.js_string Js.t -> unit Js.meth
  method setText : Js.js_string Js.t -> 'self Js.t Js.meth
  method setTextAlign : Js.js_string Js.t -> unit Js.meth
  method setTooltip : _ Js.t -> 'self Js.t Js.meth
  method setUI : Js.js_string Js.t -> unit Js.meth
  method showMenu : _ Js.t -> unit Js.meth
  method toggle : bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'self Js.t
    Js.meth
  method disabled : bool Js.t Js.readonly_prop
  method hidden : bool Js.t Js.readonly_prop
  method menu : Ext_menu_Menu.t Js.t Js.prop
  method pressed : bool Js.t Js.readonly_prop
  method template : Ext_Template.t Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Component.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method allowDepress : bool Js.t Js.prop
  method arrowAlign : Js.js_string Js.t Js.prop
  method arrowCls : Js.js_string Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method baseParams : _ Js.t Js.prop
  method clickEvent : Js.js_string Js.t Js.prop
  method cls : Js.js_string Js.t Js.prop
  method componentLayout : _ Js.t Js.prop
  method destroyMenu : bool Js.t Js.prop
  method disabled : bool Js.t Js.prop
  method enableToggle : bool Js.t Js.prop
  method focusCls : Js.js_string Js.t Js.prop
  method frame : bool Js.t Js.prop
  method glyph : _ Js.t Js.prop
  method handleMouseEvents : bool Js.t Js.prop
  method handler : _ Js.callback Js.prop
  method hidden : bool Js.t Js.prop
  method href : Js.js_string Js.t Js.prop
  method hrefTarget : Js.js_string Js.t Js.prop
  method icon : Js.js_string Js.t Js.prop
  method iconAlign : Js.js_string Js.t Js.prop
  method iconCls : Js.js_string Js.t Js.prop
  method menu : _ Js.t Js.prop
  method menuActiveCls : Js.js_string Js.t Js.prop
  method menuAlign : Js.js_string Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method overCls : Js.js_string Js.t Js.prop
  method overflowText : Js.js_string Js.t Js.prop
  method params : _ Js.t Js.prop
  method pressed : bool Js.t Js.prop
  method pressedCls : Js.js_string Js.t Js.prop
  method preventDefault : bool Js.t Js.prop
  method renderTpl : _ Js.t Js.prop
  method repeat : _ Js.t Js.prop
  method scale : _ Js.t Js.prop
  method scope : _ Js.t Js.prop
  method showEmptyMenu : bool Js.t Js.prop
  method shrinkWrap : _ Js.t Js.prop
  method tabIndex : Js.number Js.t Js.prop
  method text : Js.js_string Js.t Js.prop
  method textAlign : Js.js_string Js.t Js.prop
  method toggleGroup : Js.js_string Js.t Js.prop
  method toggleHandler : _ Js.callback Js.prop
  method tooltip : _ Js.t Js.prop
  method tooltipType : Js.js_string Js.t Js.prop
  method _type : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Component.events
  
  method click : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method glyphchange : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method iconchange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method menuhide : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method menushow : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method menutriggerout : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method menutriggerover : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseout : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseover : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method textchange : (t Js.t -> Js.js_string Js.t -> Js.js_string Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method toggle : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Component.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.button.Button"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

