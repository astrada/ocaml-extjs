class type configs = object
  method xtype : Js.js_string Js.t Js.prop
  method title : Js.js_string Js.t Js.prop
  method html : Js.js_string Js.t Js.prop
  method buttons : 'a Js.t Js.js_array Js.t Js.prop
end

class type t = object
  inherit Ext_container_AbstractContainer.t
  inherit configs
  method close : unit Js.meth
end

