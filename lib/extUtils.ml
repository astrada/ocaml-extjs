external assoc_get : 'a -> 'b -> 'c = "caml_js_assoc_get"

external assoc_set : 'a -> 'b -> 'c -> unit = "caml_js_assoc_set"

external call_parent : 'a -> string -> unit = "caml_js_call_parent"

let log message =
  Js.Unsafe.meth_call
    Firebug.console
    "log"
    [|Js.Unsafe.inject (Js.string message)|]

let undef =
  Js.Unsafe.variable "undefined"

let to_class_configs o =
  Js.Unsafe.coerce o

let alert message =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "alert")
    [|Js.Unsafe.inject message|]

let setTimeout callback timeout =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "setTimeout")
    [|Js.Unsafe.inject (Js.wrap_callback callback);
      Js.Unsafe.inject timeout;
    |]

