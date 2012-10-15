external assoc_get : 'a -> 'b -> 'c = "caml_js_assoc_get"

external assoc_set : 'a -> 'b -> 'c -> unit = "caml_js_assoc_set"

external call_parent : 'a -> string -> unit = "caml_js_call_parent"

let new_config set_properties =
  let config_object = jsnew (Js.Unsafe.variable "Object") () in
    set_properties config_object;
    config_object

let log message =
  Firebug.console##log(Js.string message)

let undef =
  Js.Unsafe.variable "undefined"

let to_class_configs o =
  Js.Unsafe.coerce o

let alert message =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "alert")
    [|Js.Unsafe.inject message|]

