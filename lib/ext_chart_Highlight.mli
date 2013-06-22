(** A mixin providing highlight functionality for Ext. ...
  
  {% <p>A mixin providing highlight functionality for <a href="#!/api/Ext.chart.series.Series" rel="Ext.chart.series.Series" class="docClass">Ext.chart.series.Series</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method highlightCfg : _ Js.t Js.prop
  (** {% <p>The default properties to apply as a highight. Value is</p>

<p>   \{
       fill: '#fdd',
       "stroke-width": 5,
       stroke: "#f55"
   \}</p> %}
    
    Defaults to: [\{fill: '#fdd', "stroke-width": 5, stroke: '#f55'\}]
    *)
  method highlightItem : _ Js.t -> unit Js.meth
  (** {% <p>Highlight the given series item.</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    {% <p>Info about the item; same format as returned by <a href="#!/api/Ext.chart.series.Bar-method-getItemForPoint" rel="Ext.chart.series.Bar-method-getItemForPoint" class="docClass">getItemForPoint</a>.</p> %}
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
  
  method highlight : _ Js.t Js.prop
  (** {% <p>Set to <code>true</code> to enable highlighting using the <a href="#!/api/Ext.chart.Highlight-property-highlightCfg" rel="Ext.chart.Highlight-property-highlightCfg" class="docClass">default highlight attributes</a>.</p>

<p>Can also be an object with style properties (i.e fill, stroke, stroke-width, radius) which are may override the <a href="#!/api/Ext.chart.Highlight-property-highlightCfg" rel="Ext.chart.Highlight-property-highlightCfg" class="docClass">default highlight attributes</a>.</p> %}
    
    Defaults to: [false]
    *)
  
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

