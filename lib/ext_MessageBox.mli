(** Singleton instance of Ext.window.MessageBox. ...
  
  {% <p>Singleton instance of <a href="#!/api/Ext.window.MessageBox" rel="Ext.window.MessageBox" class="docClass">Ext.window.MessageBox</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_window_MessageBox.t
  
  
end

class type configs =
object('self)
  inherit Ext_window_MessageBox.configs
  
  
end

class type events =
object
  inherit Ext_window_MessageBox.events
  
  
end

class type statics =
object
  inherit Ext_window_MessageBox.statics
  
  
end

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

