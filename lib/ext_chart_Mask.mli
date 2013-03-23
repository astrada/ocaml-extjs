(** Defines a mask for a chart's series.The 'chart' me ...
  
  {% <p>Defines a mask for a chart's series.
The 'chart' member must be set prior to rendering.</p>

<p>A Mask can be used to select a certain region in a chart.
When enabled, the <code>select</code> event will be triggered when a
region is selected by the mask, allowing the user to perform
other tasks like zooming on that region, etc.</p>

<p>In order to use the mask one has to set the Chart <code>mask</code> option to
<code>true</code>, <code>vertical</code> or <code>horizontal</code>. Then a possible configuration for the
listener could be:</p>

<pre><code>items: \{
    xtype: 'chart',
    animate: true,
    store: store1,
    mask: 'horizontal',
    listeners: \{
        select: \{
            fn: function(me, selection) \{
                me.setZoom(selection);
                me.mask.hide();
            \}
        \}
    \}
\}
</code></pre>

<p>In this example we zoom the chart to that particular region. You can also get
a handle to a mask instance from the chart object. The <code>chart.mask</code> element is a
<code><a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.Panel</a></code>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method mask : _ Js.t Js.prop
  (** {% <p>Enables selecting a region on chart. True to enable any selection,
'horizontal' or 'vertical' to restrict the selection to X or Y axis.</p>

<p>The mask in itself will do nothing but fire 'select' event.
See <a href="#!/api/Ext.chart.Mask" rel="Ext.chart.Mask" class="docClass">Ext.chart.Mask</a> for example.</p> %}
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

