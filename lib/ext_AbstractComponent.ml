class type events = object
  method render : ('a Js.t, 'b Js.t -> 'c Js.t -> unit) Js.meth_callback Js.prop
  method itemdblclick : ('a Js.t, 'b Js.t -> 'c Js.t -> 'd Js.t -> int -> 'e Js.t -> 'f Js.t -> unit) Js.meth_callback Js.prop
  method click : ('a Js.t, 'b Js.t -> 'c Js.t -> 'd Js.t -> unit) Js.meth_callback Js.prop
end

class type configs = object
  method autoshow : bool Js.t Js.prop
end

class type t = object
  inherit configs
  inherit events
end

