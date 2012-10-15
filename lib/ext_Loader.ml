class type t =
object('self)
  
  method history : 'a Js.js_array Js.t Js.prop
  method addClassPathMappings : 'a Js.t -> 'self Js.t Js.meth
  method exclude : 'a Js.js_array Js.t -> 'b Js.t Js.meth
  method getConfig : Js.js_string Js.t -> 'a Js.t Js.meth
  method getPath : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method loadScript : 'a Js.t -> unit Js.meth
  method onReady : 'a Js.callback -> 'b Js.t -> bool Js.t -> unit Js.meth
  method require : 'a Js.t -> 'b Js.callback Js.optdef -> 'c Js.t Js.optdef
    -> 'd Js.t Js.optdef -> unit Js.meth
  method setConfig : 'a Js.t -> 'self Js.t Js.meth
  method setPath : 'a Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  method syncRequire : 'a Js.t -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'd Js.t Js.optdef -> unit Js.meth
  
end

class type configs =
object('self)
  
  method disableCaching : bool Js.t Js.prop
  method disableCachingParam : Js.js_string Js.t Js.prop
  method enabled : bool Js.t Js.prop
  method garbageCollect : bool Js.t Js.prop
  method paths : 'a Js.t Js.prop
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

