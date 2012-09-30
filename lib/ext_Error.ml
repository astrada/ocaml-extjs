class type t =
object('self)
  
  method toString : Js.js_string Js.t Js.meth
  
end

let get_ignore () =
  Js.Unsafe.get
    (Js.Unsafe.variable "Ext.Error")
    (Js.Unsafe.variable "ignore")

let set_ignore v =
  Js.Unsafe.set
    (Js.Unsafe.variable "Ext.Error")
    (Js.Unsafe.variable "ignore")
    v

let get_notify () =
  Js.Unsafe.get
    (Js.Unsafe.variable "Ext.Error")
    (Js.Unsafe.variable "notify")

let set_notify v =
  Js.Unsafe.set
    (Js.Unsafe.variable "Ext.Error")
    (Js.Unsafe.variable "notify")
    v

let handle err =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.Error.handle")
    [|Js.Unsafe.inject err; |]

let _raise err =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.Error.raise")
    [|Js.Unsafe.inject err; |]

