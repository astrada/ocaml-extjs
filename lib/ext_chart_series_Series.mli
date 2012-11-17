(** Series is the abstract class containing the common ...
  
  {% <p>Series is the abstract class containing the common logic to all chart series. Series includes
methods from Labels, Highlights, Tips and Callouts mixins. This class implements the logic of handling
mouse events, animating, hiding, showing all elements and returning the color of the series to be used as a legend item.</p>

<h2>Listeners</h2>

<p>The series class supports listeners via the Observable syntax. Some of these listeners are:</p>

<ul>
<li><code>itemmouseup</code> When the user interacts with a marker.</li>
<li><code>itemmousedown</code> When the user interacts with a marker.</li>
<li><code>itemmousemove</code> When the user iteracts with a marker.</li>
<li><code>afterrender</code> Will be triggered when the animation ends or when the series has been rendered completely.</li>
</ul>


<p>For example:</p>

<pre><code>series: [{
        type: 'column',
        axis: 'left',
        listeners: {
                'afterrender': function() {
                        console('afterrender');
                }
        },
        xField: 'category',
        yField: 'data1'
}]
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_chart_Callout.t
  inherit Ext_chart_Highlight.t
  inherit Ext_chart_Label.t
  inherit Ext_chart_Tip.t
  inherit Ext_util_Observable.t
  
  method eachRecord : _ Js.callback -> _ Js.t -> unit Js.meth
  (** {% <p>Iterate over each of the records for this series. The default implementation simply iterates
through the entire data store, but individual series implementations can override this to
provide custom handling, e.g. adding/removing records.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to execute for each record.</p> %}
    }
    {- scope: [_ Js.t] {% <p>Scope for the fn.</p> %}
    }
    }
    *)
  method getItemForPoint : Js.number Js.t -> Js.number Js.t -> _ Js.t Js.meth
  (** {% <p>For a given x/y point relative to the Surface, find a corresponding item from this
series, if any.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    }
    {- y: [Js.number Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object describing the item, or null if there is no matching item.
The exact contents of this object will vary by series type, but should always contain the following:</p> %}
    }
    }
    *)
  method getLegendColor : _ Js.t -> unit Js.meth
  (** {% <p>Returns a string with the color to be used for the series legend item.</p> %}
    
    {b Parameters}:
    {ul {- index: [_ Js.t]
    }
    }
    *)
  method getRecordCount : unit Js.meth
  (** {% <p>Return the number of records being displayed in this series. Defaults to the number of
records in the store; individual series implementations can override to provide custom handling.</p> %}
    *)
  method hideAll : unit Js.meth
  (** {% <p>Hides all the elements in the series.</p> %}
    *)
  method isExcluded : _ Js.t -> unit Js.meth
  (** {% <p>Determines whether the series item at the given index has been excluded, i.e. toggled off in the legend.</p> %}
    
    {b Parameters}:
    {ul {- index: [_ Js.t]
    }
    }
    *)
  method setTitle : Js.number Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Changes the value of the <a href="#!/api/Ext.chart.series.Series-cfg-title" rel="Ext.chart.series.Series-cfg-title" class="docClass">title</a> for the series.
Arguments can take two forms:</p>

<ul>
<li>A single String value: this will be used as the new single title for the series (applies
to series with only one yField)</li>
<li>A numeric index and a String value: this will set the title for a single indexed yField.</li>
</ul> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    }
    {- title: [Js.js_string Js.t]
    }
    }
    *)
  method showAll : unit Js.meth
  (** {% <p>Shows all the elements in the series.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_chart_Callout.configs
  inherit Ext_chart_Highlight.configs
  inherit Ext_chart_Label.configs
  inherit Ext_chart_Tip.configs
  inherit Ext_util_Observable.configs
  
  method highlight : _ Js.t Js.prop
  (** {% <p>If set to <code>true</code> it will highlight the markers or the series when hovering
with the mouse. This parameter can also be an object with the same style
properties you would apply to a <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a> to apply custom
styles to markers and series.</p> %}
    *)
  method listeners : _ Js.t Js.prop
  (** {% <p>An (optional) object with event callbacks. All event callbacks get the target <em>item</em> as first parameter. The callback functions are:</p>

<ul>
<li>itemmouseover</li>
<li>itemmouseout</li>
<li>itemmousedown</li>
<li>itemmouseup</li>
</ul> %}
    *)
  method renderer : _ Js.callback Js.prop
  (** {% <p>A function that can be overridden to set custom styling properties to each rendered element.
Passes in (sprite, record, attributes, index, store) to the function.</p> %}
    *)
  method shadowAttributes : _ Js.js_array Js.t Js.prop
  (** {% <p>An array with shadow attributes</p> %}
    *)
  method showInLegend : bool Js.t Js.prop
  (** {% <p>Whether to show this series in the legend.</p> %}
    
    Defaults to: [true]
    *)
  method tips : _ Js.t Js.prop
  (** {% <p>Add tooltips to the visualization's markers. The options for the tips are the
same configuration used with <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>. For example:</p>

<pre><code>tips: {
  trackMouse: true,
  width: 140,
  height: 28,
  renderer: function(storeItem, item) {
    this.setTitle(storeItem.get('name') + ': ' + storeItem.get('data1') + ' views');
  }
},
</code></pre> %}
    *)
  method title : Js.js_string Js.t Js.prop
  (** {% <p>The human-readable name of the series.</p> %}
    *)
  method _type : Js.js_string Js.t Js.prop
  (** {% <p>The type of series. Set in subclasses.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_chart_Callout.events
  inherit Ext_chart_Highlight.events
  inherit Ext_chart_Label.events
  inherit Ext_chart_Tip.events
  inherit Ext_util_Observable.events
  
  method titlechange : (Js.js_string Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the series title is changed via <a href="#!/api/Ext.chart.series.Series-method-setTitle" rel="Ext.chart.series.Series-method-setTitle" class="docClass">setTitle</a>.</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    {% <p>The new title value</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index in the collection of titles</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_chart_Callout.statics
  inherit Ext_chart_Highlight.statics
  inherit Ext_chart_Label.statics
  inherit Ext_chart_Tip.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

