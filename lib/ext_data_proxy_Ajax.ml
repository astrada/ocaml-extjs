class type t = object
  inherit Ext_data_proxy_Proxy.t
  method api : 'a Js.t Js.prop
end

