(** Charts provide a flexible way to achieve a wide ra ...
  
  {% <p>Charts provide a flexible way to achieve a wide range of data visualization capablitities.
Each Chart gets its data directly from a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>, and automatically
updates its display whenever data in the Store changes. In addition, the look and feel
of a Chart can be customized using <a href="#!/api/Ext.chart.theme.Theme" rel="Ext.chart.theme.Theme" class="docClass">Theme</a>s.</p>

<h2>Creating a Simple Chart</h2>

<p>Every Chart has three key parts - a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> that contains the data,
an array of <a href="#!/api/Ext.chart.axis.Axis" rel="Ext.chart.axis.Axis" class="docClass">Axes</a> which define the boundaries of the Chart,
and one or more <a href="#!/api/Ext.chart.series.Series" rel="Ext.chart.series.Series" class="docClass">Series</a> to handle the visual rendering of the data points.</p>

<h3>1. Creating a Store</h3>

<p>The first step is to create a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> that represents the type of
data that will be displayed in the Chart. For example the data for a chart that displays
a weather forecast could be represented as a series of "WeatherPoint" data points with
two fields - "temperature", and "date":</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('WeatherPoint', \{
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['temperature', 'date']
\});
</code></pre>

<p>Next a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> must be created.  The store contains a collection of "WeatherPoint" Model instances.
The data could be loaded dynamically, but for sake of ease this example uses inline data:</p>

<pre><code>var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', \{
    model: 'WeatherPoint',
    data: [
        \{ temperature: 58, date: new Date(2011, 1, 1, 8) \},
        \{ temperature: 63, date: new Date(2011, 1, 1, 9) \},
        \{ temperature: 73, date: new Date(2011, 1, 1, 10) \},
        \{ temperature: 78, date: new Date(2011, 1, 1, 11) \},
        \{ temperature: 81, date: new Date(2011, 1, 1, 12) \}
    ]
\});
</code></pre>

<p>For additional information on Models and Stores please refer to the <a href="#/guide/data">Data Guide</a>.</p>

<h3>2. Creating the Chart object</h3>

<p>Now that a Store has been created it can be used in a Chart:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>', \{
   renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
   width: 400,
   height: 300,
   store: store
\});
</code></pre>

<p>That's all it takes to create a Chart instance that is backed by a Store.
However, if the above code is run in a browser, a blank screen will be displayed.
This is because the two pieces that are responsible for the visual display,
the Chart's <a href="#!/api/Ext.chart.Chart-cfg-axes" rel="Ext.chart.Chart-cfg-axes" class="docClass">axes</a> and <a href="#!/api/Ext.chart.Chart-cfg-series" rel="Ext.chart.Chart-cfg-series" class="docClass">series</a>, have not yet been defined.</p>

<h3>3. Configuring the Axes</h3>

<p><a href="#!/api/Ext.chart.axis.Axis" rel="Ext.chart.axis.Axis" class="docClass">Axes</a> are the lines that define the boundaries of the data points that a Chart can display.
This example uses one of the most common Axes configurations - a horizontal "x" axis, and a vertical "y" axis:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>', \{
    ...
    axes: [
        \{
            title: 'Temperature',
            type: 'Numeric',
            position: 'left',
            fields: ['temperature'],
            minimum: 0,
            maximum: 100
        \},
        \{
            title: 'Time',
            type: 'Time',
            position: 'bottom',
            fields: ['date'],
            dateFormat: 'ga'
        \}
    ]
\});
</code></pre>

<p>The "Temperature" axis is a vertical <a href="#!/api/Ext.chart.axis.Numeric" rel="Ext.chart.axis.Numeric" class="docClass">Numeric Axis</a> and is positioned on the left edge of the Chart.
It represents the bounds of the data contained in the "WeatherPoint" Model's "temperature" field that was
defined above. The minimum value for this axis is "0", and the maximum is "100".</p>

<p>The horizontal axis is a <a href="#!/api/Ext.chart.axis.Time" rel="Ext.chart.axis.Time" class="docClass">Time Axis</a> and is positioned on the bottom edge of the Chart.
It represents the bounds of the data contained in the "WeatherPoint" Model's "date" field.
The <a href="#!/api/Ext.chart.axis.Time-cfg-dateFormat" rel="Ext.chart.axis.Time-cfg-dateFormat" class="docClass">dateFormat</a>
configuration tells the Time Axis how to format it's labels.</p>

<p>Here's what the Chart looks like now that it has its Axes configured:</p>

<p><p><img src="" alt="Chart Axes" width="" height=""></p></p>

<h3>4. Configuring the Series</h3>

<p>The final step in creating a simple Chart is to configure one or more <a href="#!/api/Ext.chart.series.Series" rel="Ext.chart.series.Series" class="docClass">Series</a>.
Series are responsible for the visual representation of the data points contained in the Store.
This example only has one Series:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>', \{
    ...
    axes: [
        ...
    ],
    series: [
        \{
            type: 'line',
            xField: 'date',
            yField: 'temperature'
        \}
    ]
\});
</code></pre>

<p>This Series is a <a href="#!/api/Ext.chart.series.Line" rel="Ext.chart.series.Line" class="docClass">Line Series</a>, and it uses the "date" and "temperature" fields
from the "WeatherPoint" Models in the Store to plot its data points:</p>

<p><p><img src="" alt="Line Series" width="" height=""></p></p>

<p>See the <a href="#!/example/charts/Charts.html">Line Charts Example</a> for a live demo.</p>

<h2>Themes</h2>

<p>The color scheme for a Chart can be easily changed using the <a href="#!/api/Ext.chart.Chart-cfg-theme" rel="Ext.chart.Chart-cfg-theme" class="docClass">theme</a> configuration option:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>', \{
    ...
    theme: 'Green',
    ...
\});
</code></pre>

<p><p><img src="" alt="Green Theme" width="" height=""></p></p>

<p>For more information on Charts please refer to the <a href="#/guide/charting">Charting Guide</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_draw_Component.t
  inherit Ext_chart_Mask.t
  inherit Ext_chart_Navigation.t
  inherit Ext_chart_theme_Theme.t
  inherit Ext_util_Bindable.t
  inherit Ext_util_Observable.t
  
  method bindStore : _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Binds a store to this instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [_ Js.t] (optional)
    {% <p>The store to bind or ID of the store.
When no store given (or when <code>null</code> or <code>undefined</code> passed), unbinds the existing store.</p> %}
    }
    }
    *)
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store which is being bound to for which a listeners object should be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The listeners to be bound to the store in object literal form. The scope
may be omitted, it is assumed to be the current instance.</p> %}
    }
    }
    *)
  method initComponent : unit Js.meth
  (** {% <p>The initComponent template method is an important initialization step for a Component. It is intended to be
implemented by each subclass of <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to provide any needed constructor logic. The
initComponent method of the class being created is called first, with each initComponent method
up the hierarchy to <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> being called thereafter. This makes it easy to implement and,
if needed, override the constructor logic of the Component at any step in the hierarchy.</p>

<p>The initComponent method <strong>must</strong> contain a call to <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">callParent</a> in order
to ensure that the parent class' initComponent method is also called.</p>

<p>All config options passed to the constructor are applied to <code>this</code> before initComponent is called,
so you can simply access them with <code>this.someOption</code>.</p>

<p>The following example demonstrates using a dynamic string for the text of a button at the time of
instantiation of the class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', \{
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() \{
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    \}
\});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() \{
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
\});
</code></pre> %}
    *)
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.chart.Chart-method-show" rel="Ext.chart.Chart-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method redraw : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Redraws the chart. If animations are set this will animate the chart too.</p> %}
    
    {b Parameters}:
    {ul {- resize: [bool Js.t] (optional)
    {% <p>flag which changes the default origin points of the chart for animations.</p> %}
    }
    }
    *)
  method save : _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Saves the chart by either triggering a download or returning a string containing the chart data
as SVG.  The action depends on the export type specified in the passed configuration. The chart
will be exported using either the <a href="#!/api/Ext.draw.engine.SvgExporter" rel="Ext.draw.engine.SvgExporter" class="docClass">Ext.draw.engine.SvgExporter</a> or the <a href="#!/api/Ext.draw.engine.ImageExporter" rel="Ext.draw.engine.ImageExporter" class="docClass">Ext.draw.engine.ImageExporter</a>
classes.</p>

<p>Possible export types:</p>

<ul>
<li>'image/png'</li>
<li>'image/jpeg',</li>
<li>'image/svg+xml'</li>
</ul>


<p>If 'image/svg+xml' is specified, the SvgExporter will be used.
If 'image/png' or 'image/jpeg' are specified, the ImageExporter will be used. This exporter
must post the SVG data to a remote server to have the data processed, see the <a href="#!/api/Ext.draw.engine.ImageExporter" rel="Ext.draw.engine.ImageExporter" class="docClass">Ext.draw.engine.ImageExporter</a>
for more details.</p>

<p>Example usage:</p>

<pre><code>chart.save(\{
     type: 'image/png'
\});
</code></pre>

<p><strong>Important</strong>: By default, chart data is sent to a server operated
by Sencha to do data processing. You may change this default by
setting the <a href="#!/api/Ext.draw.engine.ImageExporter-property-defaultUrl" rel="Ext.draw.engine.ImageExporter-property-defaultUrl" class="docClass">defaultUrl</a> of the <a href="#!/api/Ext.draw.engine.ImageExporter" rel="Ext.draw.engine.ImageExporter" class="docClass">Ext.draw.engine.ImageExporter</a> class.
In addition, please note that this service only creates PNG images.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t] (optional)
    {% <p>The configuration to be passed to the exporter.
See the export method for the appropriate exporter for the relevant
configuration options</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>See the return types for the appropriate exporter</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_draw_Component.configs
  inherit Ext_chart_Mask.configs
  inherit Ext_chart_Navigation.configs
  inherit Ext_chart_theme_Theme.configs
  inherit Ext_util_Bindable.configs
  inherit Ext_util_Observable.configs
  
  method animate : _ Js.t Js.prop
  (** {% <p>True for the default animation (easing: 'ease' and duration: 500) or a standard animation config
object to be used for default chart animations. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  method axes : Ext_chart_axis_Axis.t Js.js_array Js.t Js.prop
  (** {% <p>Array of <a href="#!/api/Ext.chart.axis.Axis" rel="Ext.chart.axis.Axis" class="docClass">Axis</a> instances or config objects.  For example:</p>

<pre><code>axes: [\{
    type: 'Numeric',
    position: 'left',
    fields: ['data1'],
    title: 'Number of Hits',
    minimum: 0,
    //one minor tick between two major ticks
    minorTickSteps: 1
\}, \{
    type: 'Category',
    position: 'bottom',
    fields: ['name'],
    title: 'Month of the Year'
\}]
</code></pre> %}
    *)
  method background : _ Js.t Js.prop
  (** {% <p>The chart background. This can be a gradient object, image, or color. Defaults to false for no
background. For example, if <code>background</code> were to be a color we could set the object as</p>

<pre><code>background: \{
    //color string
    fill: '#ccc'
\}
</code></pre>

<p>You can specify an image by using:</p>

<pre><code>background: \{
    image: 'http://path.to.image/'
\}
</code></pre>

<p>Also you can specify a gradient by using the gradient object syntax:</p>

<pre><code>background: \{
    gradient: \{
        id: 'gradientId',
        angle: 45,
        stops: \{
            0: \{
                color: '#555'
            \}
            100: \{
                color: '#ddd'
            \}
        \}
    \}
\}
</code></pre> %}
    
    Defaults to: [false]
    *)
  method gradients : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>Define a set of gradients that can be used as <code>fill</code> property in sprites. The gradients array is an
array of objects with the following properties:</p>

<ul>
<li><strong>id</strong> - string - The unique name of the gradient.</li>
<li><strong>angle</strong> - number, optional - The angle of the gradient in degrees.</li>
<li><strong>stops</strong> - object - An object with numbers as keys (from 0 to 100) and style objects as values</li>
</ul>


<p>For example:</p>

<pre><code>gradients: [\{
    id: 'gradientId',
    angle: 45,
    stops: \{
        0: \{
            color: '#555'
        \},
        100: \{
            color: '#ddd'
        \}
    \}
\}, \{
    id: 'gradientId2',
    angle: 0,
    stops: \{
        0: \{
            color: '#590'
        \},
        20: \{
            color: '#599'
        \},
        100: \{
            color: '#ddd'
        \}
    \}
\}]
</code></pre>

<p>Then the sprites can use <code>gradientId</code> and <code>gradientId2</code> by setting the fill attributes to those ids, for example:</p>

<pre><code>sprite.setAttributes(\{
    fill: 'url(#gradientId)'
\}, true);
</code></pre> %}
    *)
  method insetPadding : Js.number Js.t Js.prop
  (** {% <p>The amount of inset padding in pixels for the chart. Defaults to 10.</p> %}
    
    Defaults to: [10]
    *)
  method legend : _ Js.t Js.prop
  (** {% <p>True for the default legend display or a legend config object. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  method series : Ext_chart_series_Series.t Js.js_array Js.t Js.prop
  (** {% <p>Array of <a href="#!/api/Ext.chart.series.Series" rel="Ext.chart.series.Series" class="docClass">Series</a> instances or config objects.  For example:</p>

<pre><code>series: [\{
    type: 'column',
    axis: 'left',
    listeners: \{
        'afterrender': function() \{
            console('afterrender');
        \}
    \},
    xField: 'category',
    yField: 'data1'
\}]
</code></pre> %}
    *)
  method store : Ext_data_Store.t Js.t Js.prop
  (** {% <p>The store that supplies data to this chart.</p> %}
    *)
  method theme : Js.js_string Js.t Js.prop
  (** {% <p>The name of the theme to be used. A theme defines the colors and other visual displays of tick marks
on axis, text, title text, line colors, marker colors and styles, etc. Possible theme values are 'Base', 'Green',
'Sky', 'Red', 'Purple', 'Blue', 'Yellow' and also six category themes 'Category1' to 'Category6'. Default value
is 'Base'.</p> %}
    *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  
end

class type events =
object
  inherit Ext_draw_Component.events
  inherit Ext_chart_Mask.events
  inherit Ext_chart_Navigation.events
  inherit Ext_chart_theme_Theme.events
  inherit Ext_util_Bindable.events
  inherit Ext_util_Observable.events
  
  method beforerefresh : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before a refresh to the chart data is called. If the beforerefresh handler returns false the
<a href="#!/api/Ext.chart.Chart-event-refresh" rel="Ext.chart.Chart-event-refresh" class="docClass">refresh</a> action will be cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_chart_Chart.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method refresh : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the chart data has been refreshed.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_chart_Chart.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_draw_Component.statics
  inherit Ext_chart_Mask.statics
  inherit Ext_chart_Navigation.statics
  inherit Ext_chart_theme_Theme.statics
  inherit Ext_util_Bindable.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

