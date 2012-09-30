class type t =
object('self)
  
  method self : Ext_Class.t Js.t Js.prop
  method callParent : ('a Js.t -> 'b Js.t) Js.meth
  method callSuper : ('a Js.t -> 'b Js.t) Js.meth
  method getInitialConfig : (Js.js_string Js.t -> 'a Js.t) Js.meth
  method initConfig : ('a Js.t -> t Js.t) Js.meth
  method statics : Ext_Class.t Js.t Js.meth
  
end

let addMembers members =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.Base.addMembers")
    [|Js.Unsafe.inject members; |]

let addStatics members =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.Base.addStatics")
    [|Js.Unsafe.inject members; |]

let create () =
  Js.Unsafe.fun_call (Js.Unsafe.variable "Ext.Base.create") [||]

let createAlias alias origin =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.Base.createAlias")
    [|Js.Unsafe.inject alias; Js.Unsafe.inject origin; |]

let getName () =
  Js.Unsafe.fun_call (Js.Unsafe.variable "Ext.Base.getName") [||]

