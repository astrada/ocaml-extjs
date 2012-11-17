(** Handles panning and zooming capabilities.Used as m ...
  
  {% <p>Handles panning and zooming capabilities.</p>

<p>Used as mixin by <a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method restoreZoom : unit Js.meth
  (** {% <p>Restores the zoom to the original value. This can be used to reset
the previous zoom state set by <code>setZoom</code>. For example:</p>

<pre><code>myChart.restoreZoom();
</code></pre> %}
    *)
  method setZoom : _ Js.t -> unit Js.meth
  (** {% <p>Zooms the chart to the specified selection range.
Can be used with a selection mask. For example:</p>

<pre><code>items: {
    xtype: 'chart',
    animate: true,
    store: store1,
    mask: 'horizontal',
    listeners: {
        select: {
            fn: function(me, selection) {
                me.setZoom(selection);
                me.mask.hide();
            }
        }
    }
}
</code></pre> %}
    
    {b Parameters}:
    {ul {- zoomConfig: [_ Js.t]
    }
    }
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

