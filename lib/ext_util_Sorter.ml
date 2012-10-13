class type t =
object('self)
  inherit Ext_Base.t
  
  method setDirection : Js.js_string Js.t -> unit Js.meth
  method toggle : unit Js.meth
  method updateSortFunction : 'a Js.callback Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method direction : Js.js_string Js.t Js.prop
  method property : Js.js_string Js.t Js.prop
  method root : Js.js_string Js.t Js.prop
  method sorterFn : 'a Js.callback Js.prop
  method transform : 'a Js.callback Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.Sorter"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

