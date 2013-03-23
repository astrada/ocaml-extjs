(** This class describes how a layout will interact wi ...
  
  {% <p>This class describes how a layout will interact with a component it manages.</p>

<p>There are special instances of this class stored as static properties to avoid object
instantiation. All instances of this class should be treated as readonly objects.</p> %}
  *)

class type t =
object('self)
  
  method readsHeight : bool Js.t Js.readonly_prop
  (** {% <p>Indicates that the <code>height</code> of the component is consumed.</p> %}
    *)
  method readsWidth : bool Js.t Js.readonly_prop
  (** {% <p>Indicates that the <code>width</code> of the component is consumed.</p> %}
    *)
  method setsHeight : bool Js.t Js.readonly_prop
  (** {% <p>Indicates that the <code>height</code> of the component will be set (i.e., calculated).</p> %}
    *)
  method setsWidth : bool Js.t Js.readonly_prop
  (** {% <p>Indicates that the <code>width</code> of the component will be set (i.e., calculated).</p> %}
    *)
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

