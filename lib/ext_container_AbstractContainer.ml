class type configs = object
  method layout : Js.js_string Js.t Js.prop
  method items : 'a Js.t Js.js_array Js.t Js.prop
  method autoShow : bool Js.t Js.prop
end

class type t = object
  inherit Ext_Component.t
  inherit configs

end

