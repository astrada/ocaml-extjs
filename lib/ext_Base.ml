class type t =
object('self)
  
  method self : Ext_Class.t Js.t Js.prop
  method callParent : 'a Js.t -> 'b Js.t Js.meth
  method callSuper : 'a Js.t -> 'b Js.t Js.meth
  method getInitialConfig : Js.js_string Js.t Js.optdef -> 'a Js.t Js.meth
  method initConfig : 'a Js.t -> 'self Js.t Js.meth
  method statics : Ext_Class.t Js.t Js.meth
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  method addMembers : 'a Js.t -> unit Js.meth
  method addStatics : 'a Js.t -> 'self Js.t Js.meth
  method create : 'a Js.t Js.meth
  method createAlias : 'a Js.t -> 'b Js.t -> unit Js.meth
  method getName : Js.js_string Js.t Js.meth
  
end

let static = Js.Unsafe.variable "Ext.Base"

let addMembers members =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "addMembers")
    [|Js.Unsafe.inject members; |]

let addStatics members =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "addStatics")
    [|Js.Unsafe.inject members; |]

let create () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "create") [||]

let createAlias alias origin =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "createAlias")
    [|Js.Unsafe.inject alias; Js.Unsafe.inject origin; |]

let getName () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getName") [||]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

