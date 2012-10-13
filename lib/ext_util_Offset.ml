class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

let static = Js.Unsafe.variable "Ext.util.Offset"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

