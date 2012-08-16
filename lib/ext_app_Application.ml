class type configs = object
  method appFolder : Js.js_string Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method controllers : Js.js_string Js.t Js.js_array Js.t Js.prop
end

class type properties = object
  method launch : (unit -> unit) Js.callback Js.prop
end

class type t = object
  inherit configs
  inherit properties
end

