class type t = object
  method init : ('a, 'b Js.t -> unit) Js.meth_callback Js.prop
  method stores : Js.js_string Js.t Js.js_array Js.t Js.prop
  method views : Js.js_string Js.t Js.js_array Js.t Js.prop
  method control : (string -> 'a Js.t -> unit) Js.meth
end

