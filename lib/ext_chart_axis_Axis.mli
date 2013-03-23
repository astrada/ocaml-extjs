(** Defines axis for charts. The axis position, type, ...
  
  {% <p>Defines axis for charts. The axis position, type, style can be configured.
The axes are defined in an axes array of configuration objects where the type,
field, grid and other configuration options can be set. To know more about how
to create a Chart please check the Chart class documentation. Here's an example for the axes part:
An example of axis for a series (in this case for an area chart that has multiple layers of yFields) could be:</p>

<pre><code>axes: [\{
    type: 'Numeric',
    position: 'left',
    fields: ['data1', 'data2', 'data3'],
    title: 'Number of Hits',
    grid: \{
        odd: \{
            opacity: 1,
            fill: '#ddd',
            stroke: '#bbb',
            'stroke-width': 1
        \}
    \},
    minimum: 0
\}, \{
    type: 'Category',
    position: 'bottom',
    fields: ['name'],
    title: 'Month of the Year',
    grid: true,
    label: \{
        rotate: \{
            degrees: 315
        \}
    \}
\}]
</code></pre>

<p>In this case we use a <code>Numeric</code> axis for displaying the values of the Area series and a <code>Category</code> axis for displaying the names of
the store elements. The numeric axis is placed on the left of the screen, while the category axis is placed at the bottom of the chart.
Both the category and numeric axes have <code>grid</code> set, which means that horizontal and vertical lines will cover the chart background. In the
category axis the labels will be rotated so they can fit the space better.</p> %}
  *)

class type t =
object('self)
  inherit Ext_chart_axis_Abstract.t
  
  method drawAxis : _ Js.t -> unit Js.meth
  (** {% <p>Renders the axis into the screen and updates its position.</p> %}
    
    {b Parameters}:
    {ul {- init: [_ Js.t]
    }
    }
    *)
  method drawGrid : unit Js.meth
  (** {% <p>Renders an horizontal and/or vertical grid into the Surface.</p> %}
    *)
  method drawLabel : unit Js.meth
  (** {% <p>Renders the labels in the axes.</p> %}
    *)
  method setTitle : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Updates the <a href="#!/api/Ext.chart.axis.Axis-cfg-title" rel="Ext.chart.axis.Axis-cfg-title" class="docClass">title</a> of this axis.</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_chart_axis_Abstract.configs
  
  method adjustEnd : bool Js.t Js.prop
  (** {% <p>Whether to adjust the label at the end of the axis.</p> %}
    
    Defaults to: [true]
    *)
  method dashSize : Js.number Js.t Js.prop
  (** {% <p>The size of the dash marker. Default's 3.</p> %}
    
    Defaults to: [3]
    *)
  method grid : _ Js.t Js.prop
  (** {% <p>The grid configuration enables you to set a background grid for an axis.
If set to <em>true</em> on a vertical axis, vertical lines will be drawn.
If set to <em>true</em> on a horizontal axis, horizontal lines will be drawn.
If both are set, a proper grid with horizontal and vertical lines will be drawn.</p>

<p>You can set specific options for the grid configuration for odd and/or even lines/rows.
Since the rows being drawn are rectangle sprites, you can set to an odd or even property
all styles that apply to <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>. For more information on all the style
properties you can set please take a look at <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>. Some useful style
properties are <code>opacity</code>, <code>fill</code>, <code>stroke</code>, <code>stroke-width</code>, etc.</p>

<p>The possible values for a grid option are then <em>true</em>, <em>false</em>, or an object with <code>\{ odd, even \}</code> properties
where each property contains a sprite style descriptor object that is defined in <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>.</p>

<p>For example:</p>

<pre><code>axes: [\{
    type: 'Numeric',
    position: 'left',
    fields: ['data1', 'data2', 'data3'],
    title: 'Number of Hits',
    grid: \{
        odd: \{
            opacity: 1,
            fill: '#ddd',
            stroke: '#bbb',
            'stroke-width': 1
        \}
    \}
\}, \{
    type: 'Category',
    position: 'bottom',
    fields: ['name'],
    title: 'Month of the Year',
    grid: true
\}]
</code></pre> %}
    *)
  method length : Js.number Js.t Js.prop
  (** {% <p>Offset axis position. Default's 0.</p> %}
    
    Defaults to: [0]
    *)
  method majorTickSteps : Js.number Js.t Js.prop
  (** {% <p>If <code>minimum</code> and <code>maximum</code> are specified it forces the number of major ticks to the specified value.
If a number of major ticks is forced, it wont search for pretty numbers at the ticks.</p> %}
    *)
  method minorTickSteps : Js.number Js.t Js.prop
  (** {% <p>The number of small ticks between two major ticks. Default is zero.</p> %}
    *)
  method position : Js.js_string Js.t Js.prop
  (** {% <p>Where to set the axis. Available options are <code>left</code>, <code>bottom</code>, <code>right</code>, <code>top</code>. Default's <code>bottom</code>.</p> %}
    
    Defaults to: ['bottom']
    *)
  method title : Js.js_string Js.t Js.prop
  (** {% <p>The title for the Axis</p> %}
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>Offset axis width. Default's 0.</p> %}
    
    Defaults to: [0]
    *)
  
end

class type events =
object
  inherit Ext_chart_axis_Abstract.events
  
  
end

class type statics =
object
  inherit Ext_chart_axis_Abstract.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

