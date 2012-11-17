(** Labels is a mixin to the Series class. Labels meth ...
  
  {% <p>Labels is a mixin to the Series class. Labels methods are implemented
in each of the Series (Pie, Bar, etc) for label creation and placement.</p>

<p>The methods implemented by the Series are:</p>

<ul>
<li><p><strong><code>onCreateLabel(storeItem, item, i, display)</code></strong> Called each time a new label is created.
The arguments of the method are:</p>

<ul>
<li><em><code>storeItem</code></em> The element of the store that is related to the label sprite.</li>
<li><em><code>item</code></em> The item related to the label sprite. An item is an object containing the position of the shape
used to describe the visualization and also pointing to the actual shape (circle, rectangle, path, etc).</li>
<li><em><code>i</code></em> The index of the element created (i.e the first created label, second created label, etc)</li>
<li><em><code>display</code></em> The display type. May be <b>false</b> if the label is hidden</li>
</ul>
</li>
<li><p><strong><code>onPlaceLabel(label, storeItem, item, i, display, animate)</code></strong> Called for updating the position of the label.
The arguments of the method are:</p>

<ul>
<li><em><code>label</code></em> The sprite label.</li></li>
<li><em><code>storeItem</code></em> The element of the store that is related to the label sprite</li></li>
<li><em><code>item</code></em> The item related to the label sprite. An item is an object containing the position of the shape
used to describe the visualization and also pointing to the actual shape (circle, rectangle, path, etc).</li>
<li><em><code>i</code></em> The index of the element to be updated (i.e. whether it is the first, second, third from the labelGroup)</li>
<li><em><code>display</code></em> The display type. May be <b>false</b> if the label is hidden.</li>
<li><em><code>animate</code></em> A boolean value to set or unset animations for the labels.</li>
</ul>
</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method label : _ Js.t Js.prop
  (** {% <p>Object with the following properties:</p>

<ul>
<li><p><strong>display</strong> : String</p>

<p>Specifies the presence and position of labels for each pie slice. Either "rotate", "middle", "insideStart",
"insideEnd", "outside", "over", "under", or "none" to prevent label rendering.
Default value: 'none'.</p></li>
<li><p><strong>color</strong> : String</p>

<p>The color of the label text.
Default value: '#000' (black).</p></li>
<li><p><strong>contrast</strong> : Boolean</p>

<p>True to render the label in contrasting color with the backround.
Default value: false.</p></li>
<li><p><strong>field</strong> : String</p>

<p>The name of the field to be displayed in the label.
Default value: 'name'.</p></li>
<li><p><strong>minMargin</strong> : Number</p>

<p>Specifies the minimum distance from a label to the origin of the visualization.
This parameter is useful when using PieSeries width variable pie slice lengths.
Default value: 50.</p></li>
<li><p><strong>font</strong> : String</p>

<p>The font used for the labels.
Default value: "11px Helvetica, sans-serif".</p></li>
<li><p><strong>orientation</strong> : String</p>

<p>Either "horizontal" or "vertical".
Dafault value: "horizontal".</p></li>
<li><p><strong>renderer</strong> : Function</p>

<p>Optional function for formatting the label into a displayable value.
Default value: function(v) { return v; }</p></li>
</ul> %}
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

