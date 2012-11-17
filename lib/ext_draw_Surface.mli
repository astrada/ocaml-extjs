(** A Surface is an interface to render methods inside ...
  
  {% <p>A Surface is an interface to render methods inside <a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>.</p>

<p>Most of the Surface methods are abstract and they have a concrete implementation
in <a href="#!/api/Ext.draw.engine.Vml" rel="Ext.draw.engine.Vml" class="docClass">VML</a> or <a href="#!/api/Ext.draw.engine.Svg" rel="Ext.draw.engine.Svg" class="docClass">SVG</a> engines.</p>

<p>A Surface contains methods to render <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">sprites</a>, get bounding
boxes of sprites, add sprites to the canvas, initialize other graphic components, etc.</p>

<h2>Adding sprites to surface</h2>

<p>One of the most used methods for this class is the <a href="#!/api/Ext.draw.Surface-method-add" rel="Ext.draw.Surface-method-add" class="docClass">add</a> method, to add Sprites to
the surface. For example:</p>

<pre><code>drawComponent.surface.add({
    type: 'circle',
    fill: '#ffc',
    radius: 100,
    x: 100,
    y: 100
});
</code></pre>

<p>The configuration object passed in the <code>add</code> method is the same as described in the
<a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a> class documentation.</p>

<p>Sprites can also be added to surface by setting their surface config at creation time:</p>

<pre><code>var sprite = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>', {
    type: 'circle',
    fill: '#ff0',
    surface: drawComponent.surface,
    radius: 5
});
</code></pre>

<p>In order to properly apply properties and render the sprite we have to
<code>show</code> the sprite setting the option <code>redraw</code> to <code>true</code>:</p>

<pre><code>sprite.show(true);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method add : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Adds a Sprite to the surface. See <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a> for the configuration object to be
passed into this method.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.add({
    type: 'circle',
    fill: '#ffc',
    radius: 100,
    x: 100,
    y: 100
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- args: [_ Js.t]
    {% <p>One or more Sprite objects or configs.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The sprites added.</p> %}
    }
    }
    *)
  method addCls : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Adds one or more CSS classes to the element. Duplicate classes are automatically filtered out.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.addCls(sprite, 'x-visible');
</code></pre> %}
    
    {b Parameters}:
    {ul {- sprite: [_ Js.t]
    {% <p>The sprite to add the class to.</p> %}
    }
    {- className: [_ Js.t]
    {% <p>The CSS class to add, or an array of classes</p> %}
    }
    }
    *)
  method addGradient : _ Js.t -> unit Js.meth
  (** {% <p>Adds a gradient definition to the Surface. Note that in some surface engines, adding
a gradient via this method will not take effect if the surface has already been rendered.
Therefore, it is preferred to pass the gradients as an item to the surface config, rather
than calling this method, especially if the surface is rendered immediately (e.g. due to
'renderTo' in its config). For more information on how to create gradients in the Chart
configuration object please refer to <a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>.</p>

<p>The gradient object to be passed into this method is composed by:</p>

<ul>
<li><strong>id</strong> - string - The unique name of the gradient.</li>
<li><strong>angle</strong> - number, optional - The angle of the gradient in degrees.</li>
<li><strong>stops</strong> - object - An object with numbers as keys (from 0 to 100) and style objects as values.</li>
</ul>


<p>For example:</p>

<p>   drawComponent.surface.addGradient({</p>

<pre><code>   id: 'gradientId',
   angle: 45,
   stops: {
       0: {
           color: '#555'
       },
       100: {
           color: '#ddd'
       }
   }
</code></pre>

<p>   });</p> %}
    
    {b Parameters}:
    {ul {- gradient: [_ Js.t] {% <p>A gradient config.</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys the surface. This is done by removing all components from it and
also removing its reference to a DOM element.</p>

<p>For example:</p>

<pre><code> drawComponent.surface.destroy();
</code></pre> %}
    *)
  method getGroup : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Returns a new group or an existent group associated with the current surface.
The group returned is a <a href="#!/api/Ext.draw.CompositeSprite" rel="Ext.draw.CompositeSprite" class="docClass">Ext.draw.CompositeSprite</a> group.</p>

<p>For example:</p>

<pre><code>var spriteGroup = drawComponent.surface.getGroup('someGroupId');
</code></pre> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The unique identifier of the group.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The <a href="#!/api/Ext.draw.CompositeSprite" rel="Ext.draw.CompositeSprite" class="docClass">Ext.draw.CompositeSprite</a>.</p> %}
    }
    }
    *)
  method getId : unit Js.meth
  (** {% <p>Retrieves the id of this component.
Will autogenerate an id if one has not already been set.</p> %}
    *)
  method remove : Ext_draw_Sprite.t Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Removes a given sprite from the surface, optionally destroying the sprite in the process.
You can also call the sprite own <code>remove</code> method.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.remove(sprite);
//or...
sprite.remove();
</code></pre> %}
    
    {b Parameters}:
    {ul {- sprite: [Ext_draw_Sprite.t Js.t]
    }
    {- destroySprite: [bool Js.t]
    }
    }
    *)
  method removeAll : bool Js.t -> unit Js.meth
  (** {% <p>Removes all sprites from the surface, optionally destroying the sprites in the process.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.removeAll();
</code></pre> %}
    
    {b Parameters}:
    {ul {- destroySprites: [bool Js.t]
    {% <p>Whether to destroy all sprites when removing them.</p> %}
    }
    }
    *)
  method removeCls : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Removes one or more CSS classes from the element.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.removeCls(sprite, 'x-visible');
</code></pre> %}
    
    {b Parameters}:
    {ul {- sprite: [_ Js.t]
    {% <p>The sprite to remove the class from.</p> %}
    }
    {- className: [_ Js.t]
    {% <p>The CSS class to remove, or an array of classes</p> %}
    }
    }
    *)
  method setSize : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the size of the surface. Accomodates the background (if any) to fit the new size too.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.setSize(500, 500);
</code></pre>

<p>This method is generally called when also setting the size of the draw Component.</p> %}
    
    {b Parameters}:
    {ul {- w: [Js.number Js.t]
    {% <p>The new width of the canvas.</p> %}
    }
    {- h: [Js.number Js.t] {% <p>The new height of the canvas.</p> %}
    }
    }
    *)
  method setStyle : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets CSS style attributes to an element.</p>

<p>For example:</p>

<pre><code>drawComponent.surface.setStyle(sprite, {
    'cursor': 'pointer'
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- sprite: [_ Js.t]
    {% <p>The sprite to add, or an array of classes to</p> %}
    }
    {- styles: [_ Js.t] {% <p>An Object with CSS styles.</p> %}
    }
    }
    *)
  method setText : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Changes the text in the sprite element. The sprite must be a <code>text</code> sprite.
This method can also be called from <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>.</p>

<p>For example:</p>

<pre><code>var spriteGroup = drawComponent.surface.setText(sprite, 'my new text');
</code></pre> %}
    
    {b Parameters}:
    {ul {- sprite: [_ Js.t]
    {% <p>The Sprite to change the text.</p> %}
    }
    {- text: [Js.js_string Js.t] {% <p>The new text to be set.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method height : Js.number Js.t Js.prop
  (** {% <p>The height of this component in pixels (defaults to auto).</p> %}
    *)
  method items : Ext_draw_Sprite.t Js.js_array Js.t Js.prop
  (** {% <p>Array of sprites or sprite config objects to add initially to the surface.</p> %}
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>The width of this component in pixels (defaults to auto).</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method click : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a click is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method dblclick : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a dblclick is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousedown : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mousedown is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseenter : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mouseenter is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseleave : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mouseleave is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousemove : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mousemove is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseout : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mouseout is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mouseover is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseup : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a mouseup is detected within the surface.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    {% <p>An object encapsulating the DOM event.</p> %}
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
  inherit Ext_util_Observable.statics
  
  method create_surface : _ Js.t ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Creates and returns a new concrete Surface instance appropriate for the current environment.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>Initial configuration for the Surface instance</p> %}
    }
    {- enginePriority: [Js.js_string Js.t Js.js_array Js.t] (optional)
    {% <p>order of implementations to use; the first one that is
available in the current environment will be used. Defaults to <code>['Svg', 'Vml']</code>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The created Surface or false.</p> %}
    }
    }
    *)
  method save : 'self Js.t -> _ Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Exports a <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a> in a different format.
The surface may be exported to an SVG string, using the
<a href="#!/api/Ext.draw.engine.SvgExporter" rel="Ext.draw.engine.SvgExporter" class="docClass">Ext.draw.engine.SvgExporter</a>. It may also be exported
as an image using the <a href="#!/api/Ext.draw.engine.ImageExporter" rel="Ext.draw.engine.ImageExporter" class="docClass">ImageExporter</a>.
Note that this requires sending data to a remote server to process
the SVG into an image, see the <a href="#!/api/Ext.draw.engine.ImageExporter" rel="Ext.draw.engine.ImageExporter" class="docClass">Ext.draw.engine.ImageExporter</a> for
more details.</p> %}
    
    {b Parameters}:
    {ul {- surface: [Ext_draw_Surface.t Js.t]
    {% <p>The surface to export.</p> %}
    }
    {- config: [_ Js.t] (optional)
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

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val create : _ Js.t -> Js.js_string Js.t Js.js_array Js.t Js.optdef -> _ Js.t
(** See method [statics.create] *)

val save : 'self Js.t -> _ Js.t Js.optdef -> _ Js.t
(** See method [statics.save] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

