class type t =
object('self)
  inherit Ext_Base.t
  
  method state : _ Js.t Js.prop
  method wrapsComponent : bool Js.t Js.readonly_prop
  method addCls : _ Js.t -> unit Js.meth
  method block : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method clearMarginCache : unit Js.meth
  method domBlock : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method flush : unit Js.meth
  method getBorderInfo : _ Js.t Js.meth
  method getClassList : unit Js.meth
  method getDomProp : Js.js_string Js.t -> _ Js.t Js.meth
  method getEl : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method getFrameInfo : _ Js.t Js.meth
  method getMarginInfo : _ Js.t Js.meth
  method getPaddingInfo : _ Js.t Js.meth
  method getProp : Js.js_string Js.t -> _ Js.t Js.meth
  method getStyle : Js.js_string Js.t -> _ Js.t Js.meth
  method getStyles : Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  method hasDomProp : Js.js_string Js.t -> bool Js.t Js.meth
  method hasProp : Js.js_string Js.t -> bool Js.t Js.meth
  method invalidate : _ Js.t -> unit Js.meth
  method recoverProp : Js.js_string Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method removeCls : _ Js.t -> unit Js.meth
  method removeEl : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  method setAttribute : _ Js.t -> _ Js.t -> unit Js.meth
  method setContentHeight : _ Js.t -> _ Js.t -> unit Js.meth
  method setContentSize : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method setContentWidth : _ Js.t -> _ Js.t -> unit Js.meth
  method setHeight : Js.number Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  method setProp : Js.js_string Js.t -> _ Js.t -> bool Js.t -> Js.number Js.t
    Js.meth
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

let get_static () = Js.Unsafe.variable "Ext.layout.ContextItem"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

