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

let get_global n =
  Js.Unsafe.get Dom_html.window (Js.string n)

let set_global n v =
  Js.Unsafe.set Dom_html.window (Js.string n) v

let test_global n =
  Js.Optdef.test (get_global n)

