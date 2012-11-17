(** Provides chart theming.Used as mixins by Ext.chart ...
  
  {% <p>Provides chart theming.</p>

<p>Used as mixins by <a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>.</p> %}
  *)

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

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

