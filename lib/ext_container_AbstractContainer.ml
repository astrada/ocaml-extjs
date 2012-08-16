class type configs = object
  method layout : Js.js_string Js.t Js.prop
  method items : Js.Unsafe.any Js.js_array Js.t Js.prop
  method autoShow : bool Js.t Js.prop
end

class type t = object
  inherit Ext_Component.t
  inherit configs

end

