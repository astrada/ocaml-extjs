class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method disabled : bool Js.t Js.readonly_prop
  method hidden : bool Js.t Js.readonly_prop
  method menu : Ext_menu_Menu.t Js.t Js.prop
  method pressed : bool Js.t Js.readonly_prop
  method template : Ext_Template.t Js.t Js.prop
  method beforeDestroy : unit Js.meth
  method disable : bool Js.t Js.optdef -> unit Js.meth
  method enable : bool Js.t Js.optdef -> unit Js.meth
  method getTemplateArgs : 'a Js.t Js.meth
  method getText : Js.js_string Js.t Js.meth
  method hasVisibleMenu : bool Js.t Js.meth
  method hideMenu : 'self Js.t Js.meth
  method initComponent : unit Js.meth
  method onDestroy : unit Js.meth
  method onDisable : unit Js.meth
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  method setHandler : 'a Js.callback -> 'b Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setIcon : Js.js_string Js.t -> 'self Js.t Js.meth
  method setIconCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method setParams : 'a Js.t -> unit Js.meth
  method setScale : Js.js_string Js.t -> unit Js.meth
  method setText : Js.js_string Js.t -> 'self Js.t Js.meth
  method setTextAlign : Js.js_string Js.t -> unit Js.meth
  method setTooltip : 'a Js.t -> 'self Js.t Js.meth
  method setUI : Js.js_string Js.t -> unit Js.meth
  method showMenu : unit Js.meth
  method toggle : bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'self Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  method allowDepress : bool Js.t Js.prop
  method arrowAlign : Js.js_string Js.t Js.prop
  method arrowCls : Js.js_string Js.t Js.prop
  method baseCls : Js.js_string Js.t Js.prop
  method baseParams : 'a Js.t Js.prop
  method border_bool : bool Js.t Js.prop
  method clickEvent : Js.js_string Js.t Js.prop
  method cls : Js.js_string Js.t Js.prop
  method componentLayout_str : Js.js_string Js.t Js.prop
  method disabled : bool Js.t Js.prop
  method enableToggle : bool Js.t Js.prop
  method focusCls : Js.js_string Js.t Js.prop
  method frame : bool Js.t Js.prop
  method handleMouseEvents : bool Js.t Js.prop
  method handler : 'a Js.callback Js.prop
  method hidden : bool Js.t Js.prop
  method href : Js.js_string Js.t Js.prop
  method hrefTarget : Js.js_string Js.t Js.prop
  method icon : Js.js_string Js.t Js.prop
  method iconAlign : Js.js_string Js.t Js.prop
  method iconCls : Js.js_string Js.t Js.prop
  method menu : 'a Js.t Js.prop
  method menuActiveCls : Js.js_string Js.t Js.prop
  method menuAlign : Js.js_string Js.t Js.prop
  method minWidth : Js.number Js.t Js.prop
  method overCls : Js.js_string Js.t Js.prop
  method overflowText : Js.js_string Js.t Js.prop
  method params : 'a Js.t Js.prop
  method pressed : bool Js.t Js.prop
  method pressedCls : Js.js_string Js.t Js.prop
  method preventDefault : bool Js.t Js.prop
  method renderTpl_arr : 'a Js.js_array Js.t Js.prop
  method repeat : 'a Js.t Js.prop
  method scale : Js.js_string Js.t Js.prop
  method scope : 'a Js.t Js.prop
  method shrinkWrap_num : Js.number Js.t Js.prop
  method tabIndex : Js.number Js.t Js.prop
  method text : Js.js_string Js.t Js.prop
  method textAlign : Js.js_string Js.t Js.prop
  method toggleGroup : Js.js_string Js.t Js.prop
  method toggleHandler : 'a Js.callback Js.prop
  method tooltip : 'a Js.t Js.prop
  method tooltipType : Js.js_string Js.t Js.prop
  method type_ : Js.js_string Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  method click : (t Js.t -> Dom_html.event Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method menuhide : (t Js.t -> Ext_menu_Menu.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method menushow : (t Js.t -> Ext_menu_Menu.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method menutriggerout : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method menutriggerover : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  method mouseout : (t Js.t -> Dom_html.event Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method mouseover : (t Js.t -> Dom_html.event Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method toggle : (t Js.t -> bool Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  
  
end

let static = Js.Unsafe.variable "Ext.button.Button"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

