class type t =
object('self)
  inherit Ext_Base.t
  
  method state : 'a Js.t Js.prop
  method wrapsComponent : bool Js.t Js.readonly_prop
  method addCls : 'a Js.t -> unit Js.meth
  method block : 'a Js.t -> Js.js_string Js.t -> unit Js.meth
  method clearMarginCache : unit Js.meth
  method domBlock : 'a Js.t -> Js.js_string Js.t -> unit Js.meth
  method flush : unit Js.meth
  method getBorderInfo : 'a Js.t Js.meth
  method getClassList : unit Js.meth
  method getDomProp : Js.js_string Js.t -> 'a Js.t Js.meth
  method getEl : 'a Js.t -> 'b Js.t -> unit Js.meth
  method getFrameInfo : 'a Js.t Js.meth
  method getMarginInfo : 'a Js.t Js.meth
  method getPaddingInfo : 'a Js.t Js.meth
  method getProp : Js.js_string Js.t -> 'a Js.t Js.meth
  method getStyle : Js.js_string Js.t -> 'a Js.t Js.meth
  method getStyles : Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> 'a Js.t Js.meth
  method hasDomProp : Js.js_string Js.t -> bool Js.t Js.meth
  method hasProp : Js.js_string Js.t -> bool Js.t Js.meth
  method invalidate : 'a Js.t -> unit Js.meth
  method recoverProp : Js.js_string Js.t -> 'a Js.t -> 'b Js.t -> unit
    Js.meth
  method removeCls : 'a Js.t -> unit Js.meth
  method setAttribute : 'a Js.t -> 'b Js.t -> unit Js.meth
  method setContentHeight : 'a Js.t -> 'b Js.t -> unit Js.meth
  method setContentSize : 'a Js.t -> 'b Js.t -> 'c Js.t -> unit Js.meth
  method setContentWidth : 'a Js.t -> 'b Js.t -> unit Js.meth
  method setHeight : Js.number Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  method setProp : Js.js_string Js.t -> 'a Js.t -> bool Js.t ->
    Js.number Js.t Js.meth
  method setWidth : Js.number Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.layout.ContextItem"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

