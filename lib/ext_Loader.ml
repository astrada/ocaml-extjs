class type t =
object('self)
  
  method history : _ Js.js_array Js.t Js.prop
  method addClassPathMappings : _ Js.t -> 'self Js.t Js.meth
  method exclude : _ Js.js_array Js.t -> _ Js.t Js.meth
  method getConfig : Js.js_string Js.t -> _ Js.t Js.meth
  method getPath : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method loadScript : _ Js.t -> unit Js.meth
  method onReady : _ Js.callback -> _ Js.t -> bool Js.t -> unit Js.meth
  method require : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method setConfig : _ Js.t -> 'self Js.t Js.meth
  method setPath : _ Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  method syncRequire : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  
  method disableCaching : bool Js.t Js.prop
  method disableCachingParam : Js.js_string Js.t Js.prop
  method enabled : bool Js.t Js.prop
  method garbageCollect : bool Js.t Js.prop
  method paths : _ Js.t Js.prop
  method preserveScripts : bool Js.t Js.prop
  method scriptChainDelay : bool Js.t Js.prop
  method scriptCharset : Js.js_string Js.t Js.prop
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

let static = Js.Unsafe.variable "Ext.Loader"

let get_instance () = Js.Unsafe.variable "Ext.Loader"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

