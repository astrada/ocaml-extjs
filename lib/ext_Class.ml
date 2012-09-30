class type t =
object('self)
  
  method alias : Js.js_string Js.t Js.js_array Js.t Js.prop
  method alternateClassName : 'a Js.t Js.prop
  method config : 'a Js.t Js.prop
  method extend : Js.js_string Js.t Js.prop
  method inheritableStatics : 'a Js.t Js.prop
  method mixins : 'a Js.t Js.prop
  method requires : Js.js_string Js.t Js.js_array Js.t Js.prop
  method singleton : bool Js.t Js.prop
  method statics : 'a Js.t Js.prop
  method uses : Js.js_string Js.t Js.js_array Js.t Js.prop
  
end

