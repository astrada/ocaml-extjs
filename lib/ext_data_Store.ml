class type t = object
  method fields : Js.js_string Js.t Js.js_array Js.t Js.prop
  method data : 'a Js.t Js.js_array Js.t Js.prop
  method model : Js.js_string Js.t Js.prop
  method autoLoad : bool Js.t Js.prop
  method proxy : 'a Js.t Js.prop
end

