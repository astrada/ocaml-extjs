(** A mixin providing highlight functionality for Ext. ...
  
  {% <p>A mixin providing highlight functionality for <a href="#!/api/Ext.chart.series.Series" rel="Ext.chart.series.Series" class="docClass">Ext.chart.series.Series</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method highlight : _ Js.t -> unit Js.meth
  (** {% <p>Highlight the given series item.</p> %}
    
    {b Parameters}:
    {ul {- default: [_ Js.t]
    {% <p>'s false. Can also be an object width style properties (i.e fill, stroke, radius)
or just use default styles per series by setting highlight = true.</p> %}
    }
    }
    *)
  method highlightItem : _ Js.t -> unit Js.meth
  (** {% <p>Highlight the given series item.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>Info about the item; same format as returned by #getItemForPoint.</p> %}
    }
    }
    *)
  method unHighlightItem : unit Js.meth
  (** {% <p>Un-highlight any existing highlights</p> %}
    *)
  
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

