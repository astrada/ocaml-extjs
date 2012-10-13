class type t =
object('self)
  inherit Ext_Base.t
  
  method hasListeners : 'a Js.t Js.readonly_prop
  method isObservable : bool Js.t Js.prop
  method addEvents : 'a Js.t -> unit Js.meth
  method addListener : 'a Js.t -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> 'd Js.t Js.optdef -> unit Js.meth
  method addManagedListener : 'a Js.t -> 'b Js.t -> 'c Js.callback Js.optdef
    -> 'd Js.t Js.optdef -> 'e Js.t Js.optdef -> unit Js.meth
  method clearListeners : unit Js.meth
  method clearManagedListeners : unit Js.meth
  method enableBubble : 'a Js.t -> unit Js.meth
  method fireEvent : Js.js_string Js.t -> 'a Js.t -> bool Js.t Js.meth
  method hasListener : Js.js_string Js.t -> bool Js.t Js.meth
  method mon : 'a Js.t -> 'b Js.t -> 'c Js.callback Js.optdef ->
    'd Js.t Js.optdef -> 'e Js.t Js.optdef -> unit Js.meth
  method mun : 'a Js.t -> 'b Js.t -> 'c Js.callback Js.optdef ->
    'd Js.t Js.optdef -> unit Js.meth
  method on : 'a Js.t -> 'b Js.callback Js.optdef -> 'c Js.t Js.optdef ->
    'd Js.t Js.optdef -> unit Js.meth
  method relayEvents : 'a Js.t -> Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  method removeListener : Js.js_string Js.t -> 'a Js.callback ->
    'b Js.t Js.optdef -> unit Js.meth
  method removeManagedListener : 'a Js.t -> 'b Js.t ->
    'c Js.callback Js.optdef -> 'd Js.t Js.optdef -> unit Js.meth
  method resumeEvents : unit Js.meth
  method suspendEvents : bool Js.t -> unit Js.meth
  method un : Js.js_string Js.t -> 'a Js.callback -> 'b Js.t Js.optdef ->
    unit Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method listeners : 'a Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method capture : 'self Js.t -> 'a Js.callback -> 'b Js.t Js.optdef -> unit
    Js.meth
  method observe : 'a Js.callback -> 'b Js.t -> unit Js.meth
  method releaseCapture : 'self Js.t -> unit Js.meth
  
end

let static = Js.Unsafe.variable "Ext.util.Observable"

let capture o fn scope =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "capture")
    [|Js.Unsafe.inject o; Js.Unsafe.inject fn; Js.Unsafe.inject scope; |]

let observe c listeners =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "observe")
    [|Js.Unsafe.inject c; Js.Unsafe.inject listeners; |]

let releaseCapture o =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "releaseCapture")
    [|Js.Unsafe.inject o; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

