class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isMixedCollection : bool Js.t Js.prop
  method add : 'a Js.t -> 'b Js.t Js.optdef -> 'c Js.t Js.meth
  method addAll : 'a Js.t -> unit Js.meth
  method clear : unit Js.meth
  method clone : 'self Js.t Js.meth
  method collect : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'a Js.js_array Js.t Js.meth
  method contains : 'a Js.t -> bool Js.t Js.meth
  method containsKey : Js.js_string Js.t -> bool Js.t Js.meth
  method each : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method eachKey : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method filter : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method filterBy : 'a Js.callback -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  method findBy : 'a Js.callback -> 'b Js.t Js.optdef -> 'c Js.t Js.meth
  method findIndex : Js.js_string Js.t -> 'a Js.t -> Js.number Js.t Js.optdef
    -> bool Js.t Js.optdef -> bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method findIndexBy : 'a Js.callback -> 'b Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  method first : 'a Js.t Js.meth
  method get : 'a Js.t -> 'b Js.t Js.meth
  method getAt : Js.number Js.t -> 'a Js.t Js.meth
  method getByKey : 'a Js.t -> 'b Js.t Js.meth
  method getCount : Js.number Js.t Js.meth
  method getKey : 'a Js.t -> 'b Js.t Js.meth
  method getRange : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    'a Js.js_array Js.t Js.meth
  method indexOf : 'a Js.t -> Js.number Js.t Js.meth
  method indexOfKey : Js.js_string Js.t -> Js.number Js.t Js.meth
  method insert : Js.number Js.t -> Js.js_string Js.t -> 'a Js.t Js.optdef ->
    'b Js.t Js.meth
  method last : 'a Js.t Js.meth
  method remove : 'a Js.t -> 'b Js.t Js.meth
  method removeAll : 'a Js.js_array Js.t -> 'self Js.t Js.meth
  method removeAt : Js.number Js.t -> 'a Js.t Js.meth
  method removeAtKey : Js.js_string Js.t -> 'a Js.t Js.meth
  method replace : Js.js_string Js.t -> 'a Js.t -> 'b Js.t Js.meth
  method sum : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> Js.number Js.t
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method allowFunctions : bool Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method add : (Js.number Js.t -> 'a Js.t -> Js.js_string Js.t -> 'b Js.t ->
    unit) Js.callback Js.writeonly_prop
  method clear : ('a Js.t -> unit) Js.callback Js.writeonly_prop
  method remove : ('a Js.t -> Js.js_string Js.t Js.optdef -> 'b Js.t -> unit)
    Js.callback Js.writeonly_prop
  method replace : (Js.js_string Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.AbstractMixedCollection"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

