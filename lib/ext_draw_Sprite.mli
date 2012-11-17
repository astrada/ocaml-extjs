(** A Sprite is an object rendered in a Drawing surfac ...
  
  {% <p>A Sprite is an object rendered in a Drawing surface.</p>

<h2>Types</h2>

<p>The following sprite types are supported:</p>

<h3>Rect</h3>

<p>Rectangle requires <code>width</code> and <code>height</code> attributes:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: 'rect',
        width: 100,
        height: 50,
        radius: 10,
        fill: 'green',
        opacity: 0.5,
        stroke: 'red',
        'stroke-width': 2
    }]
});
</code></pre>

<h3>Circle</h3>

<p>Circle requires <code>x</code>, <code>y</code> and <code>radius</code> attributes:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: 'circle',
        radius: 90,
        x: 100,
        y: 100,
        fill: 'blue',
    }]
});
</code></pre>

<h3>Ellipse</h3>

<p>Ellipse requires <code>x</code>, <code>y</code>, <code>radiusX</code> and <code>radiusY</code> attributes:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: "ellipse",
        radiusX: 100,
        radiusY: 50,
        x: 100,
        y: 100,
        fill: 'red'
    }]
});
</code></pre>

<h3>Path</h3>

<p>Path requires the <code>path</code> attribute:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: "path",
        path: "M-66.6 26C-66.6 26 -75 22 -78.2 18.4C-81.4 14.8 -80.948 19.966 " +
              "-85.8 19.6C-91.647 19.159 -90.6 3.2 -90.6 3.2L-94.6 10.8C-94.6 " +
              "10.8 -95.8 25.2 -87.8 22.8C-83.893 21.628 -82.6 23.2 -84.2 " +
              "24C-85.8 24.8 -78.6 25.2 -81.4 26.8C-84.2 28.4 -69.8 23.2 -72.2 " +
              "33.6L-66.6 26z",
        fill: "purple"
    }]
});
</code></pre>

<h3>Text</h3>

<p>Text requires the <code>text</code> attribute:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: "text",
        text: "Hello, Sprite!",
        fill: "green",
        font: "18px monospace"
    }]
});
</code></pre>

<h3>Image</h3>

<p>Image requires <code>width</code>, <code>height</code> and <code>src</code> attributes:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    width: 200,
    height: 200,
    items: [{
        type: "image",
        src: "http://www.sencha.com/img/apple-touch-icon.png",
        width: 200,
        height: 200
    }]
});
</code></pre>

<h2>Creating and adding a Sprite to a Surface</h2>

<p>See <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">Ext.draw.Surface</a> documentation.</p>

<h2>Transforming sprites</h2>

<p>See <a href="#!/api/Ext.draw.Sprite-method-setAttributes" rel="Ext.draw.Sprite-method-setAttributes" class="docClass">setAttributes</a> method documentation for examples on how to translate, scale and rotate the sprites.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Animate.t
  inherit Ext_util_Observable.t
  
  method dd : Ext_dd_DragSource.t Js.t Js.prop
  (** {% <p>If this Sprite is configured <a href="#!/api/Ext.draw.Sprite-cfg-draggable" rel="Ext.draw.Sprite-cfg-draggable" class="docClass">draggable</a>, this property will contain
an instance of <a href="#!/api/Ext.dd.DragSource" rel="Ext.dd.DragSource" class="docClass">Ext.dd.DragSource</a> which handles dragging the Sprite.</p>

<p>The developer must provide implementations of the abstract methods of <a href="#!/api/Ext.dd.DragSource" rel="Ext.dd.DragSource" class="docClass">Ext.dd.DragSource</a>
in order to supply behaviour for each stage of the drag/drop process. See <a href="#!/api/Ext.draw.Sprite-cfg-draggable" rel="Ext.draw.Sprite-cfg-draggable" class="docClass">draggable</a>.</p> %}
    *)
  method isSprite : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Sprite, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method addCls : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds one or more CSS classes to the element. Duplicate classes are automatically filtered out.  Note this method
is severly limited in VML.</p> %}
    
    {b Parameters}:
    {ul {- className: [_ Js.t]
    {% <p>The CSS class to add, or an array of classes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Removes the sprite and clears all listeners.</p> %}
    *)
  method getBBox : _ Js.t Js.meth
  (** {% <p>Retrieves the bounding box of the sprite.
This will be returned as an object with x, y, width, and height properties.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>bbox</p> %}
    }
    }
    *)
  method hide : bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Hides the sprite.</p> %}
    
    {b Parameters}:
    {ul {- redraw: [bool Js.t]
    {% <p>Flag to immediately draw the change.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method redraw : 'self Js.t Js.meth
  (** {% <p>Redraws the sprite.</p> %}
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method remove : bool Js.t Js.meth
  (** {% <p>Removes the sprite.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if sprite was successfully removed.
False when there was no surface to remove it from.</p> %}
    }
    }
    *)
  method removeCls : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Removes one or more CSS classes from the element.</p> %}
    
    {b Parameters}:
    {ul {- className: [_ Js.t]
    {% <p>The CSS class to remove, or an array of classes.  Note this method
is severly limited in VML.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setAttributes : _ Js.t -> bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Change the attributes of the sprite.</p>

<h2>Translation</h2>

<p>For translate, the configuration object contains x and y attributes that indicate where to
translate the object. For example:</p>

<pre><code>sprite.setAttributes({
  translate: {
   x: 10,
   y: 10
  }
}, true);
</code></pre>

<h2>Rotation</h2>

<p>For rotation, the configuration object contains x and y attributes for the center of the rotation (which are optional),
and a <code>degrees</code> attribute that specifies the rotation in degrees. For example:</p>

<pre><code>sprite.setAttributes({
  rotate: {
   degrees: 90
  }
}, true);
</code></pre>

<p>That example will create a 90 degrees rotation using the centroid of the Sprite as center of rotation, whereas:</p>

<pre><code>sprite.setAttributes({
  rotate: {
   x: 0,
   y: 0,
   degrees: 90
  }
}, true);
</code></pre>

<p>will create a rotation around the <code>(0, 0)</code> axis.</p>

<h2>Scaling</h2>

<p>For scaling, the configuration object contains x and y attributes for the x-axis and y-axis scaling. For example:</p>

<pre><code>sprite.setAttributes({
  scale: {
   x: 10,
   y: 3
  }
}, true);
</code></pre>

<p>You can also specify the center of scaling by adding <code>cx</code> and <code>cy</code> as properties:</p>

<pre><code>sprite.setAttributes({
  scale: {
   cx: 0,
   cy: 0,
   x: 10,
   y: 3
  }
}, true);
</code></pre>

<p>That last example will scale a sprite taking as centers of scaling the <code>(0, 0)</code> coordinate.</p> %}
    
    {b Parameters}:
    {ul {- attrs: [_ Js.t]
    {% <p>attributes to be changed on the sprite.</p> %}
    }
    {- redraw: [bool Js.t]
    {% <p>Flag to immediately draw the change.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setStyle : _ Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Wrapper for setting style properties, also takes single object parameter of multiple styles.</p> %}
    
    {b Parameters}:
    {ul {- property: [_ Js.t]
    {% <p>The style property to be set, or an object of multiple styles.</p> %}
    }
    {- value: [Js.js_string Js.t] (optional)
    {% <p>The value to apply to the given property, or null if an object was passed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method show : bool Js.t -> 'self Js.t Js.meth
  (** {% <p>Shows the sprite.</p> %}
    
    {b Parameters}:
    {ul {- redraw: [bool Js.t]
    {% <p>Flag to immediately draw the change.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_draw_Sprite.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Animate.configs
  inherit Ext_util_Observable.configs
  
  method draggable : bool Js.t Js.prop
  (** {% <p>True to make the sprite draggable.</p> %}
    *)
  method fill : Js.js_string Js.t Js.prop
  (** {% <p>The fill color.</p> %}
    *)
  method font : Js.js_string Js.t Js.prop
  (** {% <p>Used with text type sprites. The full font description.
Uses the same syntax as the CSS font parameter</p> %}
    *)
  method group : _ Js.t Js.prop
  (** {% <p>The group that this sprite belongs to, or an array of groups.
Only relevant when added to a <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">Surface</a>.</p> %}
    *)
  method height : Js.number Js.t Js.prop
  (** {% <p>The height of the rect or image sprite.</p> %}
    *)
  method opacity : Js.number Js.t Js.prop
  (** {% <p>The opacity of the sprite. A number between 0 and 1.</p> %}
    *)
  method path : Js.js_string Js.t Js.prop
  (** {% <p>The path of the path sprite written in SVG-like path syntax.</p> %}
    *)
  method radius : Js.number Js.t Js.prop
  (** {% <p>The radius of the circle sprite. Or in case of rect sprite, the border radius.</p> %}
    *)
  method radiusX : Js.number Js.t Js.prop
  (** {% <p>The radius of the ellipse sprite along x-axis.</p> %}
    *)
  method radiusY : Js.number Js.t Js.prop
  (** {% <p>The radius of the ellipse sprite along y-axis.</p> %}
    *)
  method src : Js.js_string Js.t Js.prop
  (** {% <p>Path to the image to show in image sprites.</p> %}
    *)
  method stroke : Js.js_string Js.t Js.prop
  (** {% <p>The stroke color.</p> %}
    *)
  method stroke_width : Js.number Js.t Js.prop
  (** {% <p>The width of the stroke.</p>

<p>Note that this attribute needs to be quoted when used.  Like so:</p>

<pre><code>"stroke-width": 12,
</code></pre> %}
    *)
  method text : Js.js_string Js.t Js.prop
  (** {% <p>The actual text to render in text sprites.</p> %}
    *)
  method _type : Js.js_string Js.t Js.prop
  (** {% <p>The type of the sprite.
Possible options are 'circle', 'ellipse', 'path', 'rect', 'text', 'image'.</p>

<p>See <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a> class documentation for examples of all types.</p> %}
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>The width of the rect or image sprite.</p> %}
    *)
  method x : Js.number Js.t Js.prop
  (** {% <p>Sprite position along the x-axis.</p> %}
    *)
  method y : Js.number Js.t Js.prop
  (** {% <p>Sprite position along the y-axis.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Animate.events
  inherit Ext_util_Observable.events
  
  method beforedestroy : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the sprite is destroyed. Return false from an event handler to stop the destroy.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_draw_Sprite.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method click : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouse click is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method destroy : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the sprite is destroyed.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_draw_Sprite.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousedown : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mousedown is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousemove : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mousemove is detected with the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseout : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseout is detected with the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (Ext_EventObject.t Js.t -> Dom_html.element Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseover is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseup : (Ext_EventObject.t Js.t -> Dom_html.element Js.t -> _ Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a mouseup is detected within the element.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>The <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> encapsulating the DOM event.</p> %}
    }
    {- t: [Dom_html.element Js.t]
    {% <p>The target of the event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method render : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires after the sprite markup is rendered.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_draw_Sprite.t Js.t]
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
  inherit Ext_util_Animate.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

