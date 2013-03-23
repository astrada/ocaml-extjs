class type t =
object('self)
  inherit Ext_util_Observable.t
  inherit Ext_Base.t
  
  method add : _ Js.t -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method addAll : _ Js.t -> unit Js.meth
  method clear : unit Js.meth
  method clone : 'self Js.t Js.meth
  method collect : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> _ Js.js_array Js.t Js.meth
  method contains : _ Js.t -> bool Js.t Js.meth
  method containsKey : Js.js_string Js.t -> bool Js.t Js.meth
  method each : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method eachKey : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method filter : _ Js.t -> _ Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method filterBy : _ Js.callback -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method findBy : _ Js.callback -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method findIndex : Js.js_string Js.t -> _ Js.t -> Js.number Js.t Js.optdef
    -> bool Js.t Js.optdef -> bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method findIndexBy : _ Js.callback -> _ Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  method first : _ Js.t Js.meth
  method get : _ Js.t -> _ Js.t Js.meth
  method getAt : Js.number Js.t -> _ Js.t Js.meth
  method getByKey : _ Js.t -> _ Js.t Js.meth
  method getCount : Js.number Js.t Js.meth
  method getKey : _ Js.t -> _ Js.t Js.meth
  method getRange : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    _ Js.js_array Js.t Js.meth
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  method indexOfKey : Js.js_string Js.t -> Js.number Js.t Js.meth
  method insert : Js.number Js.t -> _ Js.t -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  method last : _ Js.t Js.meth
  method remove : _ Js.t -> _ Js.t Js.meth
  method removeAll : _ Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  method removeAt : Js.number Js.t -> _ Js.t Js.meth
  method removeAtKey : Js.js_string Js.t -> _ Js.t Js.meth
  method removeRange : Js.number Js.t -> Js.number Js.t Js.optdef -> _ Js.t
    Js.meth
  method replace : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  method sum : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> Js.number Js.t
    Js.meth
  method updateKey : _ Js.t -> _ Js.t -> unit Js.meth
  method isMixedCollection : bool Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_util_Observable.configs
  inherit Ext_Base.configs
  
  method getKey : ('self Js.t, _ Js.t -> _ Js.t) Js.meth_callback
    Js.writeonly_prop
  method allowFunctions : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_util_Observable.events
  inherit Ext_Base.events
  
  method add : (Js.number Js.t -> _ Js.t -> Js.js_string Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method clear : (_ Js.t -> unit) Js.callback Js.writeonly_prop
  method remove : (_ Js.t -> Js.js_string Js.t Js.optdef -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method replace : (Js.js_string Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let get_static () = Js.Unsafe.variable "Ext.util.AbstractMixedCollection"

let static = get_static ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

