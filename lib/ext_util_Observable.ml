class type t =
object('self)
  inherit Ext_Base.t
  
  method hasListeners : _ Js.t Js.readonly_prop
  method isObservable : bool Js.t Js.prop
  method addEvents : _ Js.t -> unit Js.meth
  method addListener : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method addManagedListener : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method clearListeners : unit Js.meth
  method clearManagedListeners : unit Js.meth
  method enableBubble : _ Js.t -> unit Js.meth
  method fireEvent : Js.js_string Js.t -> _ Js.t -> bool Js.t Js.meth
  method fireEventArgs : Js.js_string Js.t -> _ Js.t Js.js_array Js.t ->
    bool Js.t Js.meth
  method hasListener : Js.js_string Js.t -> bool Js.t Js.meth
  method mon : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method mun : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method on : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  method relayEvents : _ Js.t -> Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  method removeListener : Js.js_string Js.t -> _ Js.callback ->
    _ Js.t Js.optdef -> unit Js.meth
  method removeManagedListener : _ Js.t -> _ Js.t -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  method resumeEvent : Js.js_string Js.t -> unit Js.meth
  method resumeEvents : unit Js.meth
  method suspendEvent : Js.js_string Js.t -> unit Js.meth
  method suspendEvents : bool Js.t -> unit Js.meth
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method listeners : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method capture : 'self Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  method observe : _ Js.callback -> _ Js.t -> unit Js.meth
  method releaseCapture : 'self Js.t -> unit Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Observable"

let static = get_static ()

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

