(** The Draw Component is a surface in which sprites c ...
  
  {% <p>The Draw Component is a surface in which sprites can be rendered. The Draw Component
manages and holds an <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">Ext.draw.Surface</a> instance where
<a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Sprites</a> can be appended.</p>

<p>One way to create a draw component is:</p>

<pre class='inline-example '><code>var drawComponent = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    viewBox: false,
    items: [{
        type: 'circle',
        fill: '#79BB3F',
        radius: 100,
        x: 100,
        y: 100
    }]
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.Window</a>', {
    width: 215,
    height: 235,
    layout: 'fit',
    items: [drawComponent]
}).show();
</code></pre>

<p>In this case we created a draw component and added a <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">sprite</a> to it.
The <a href="#!/api/Ext.draw.Sprite-cfg-type" rel="Ext.draw.Sprite-cfg-type" class="docClass">type</a> of the sprite is <code>circle</code> so if you run this code you'll see a yellow-ish
circle in a Window. When setting <code>viewBox</code> to <code>false</code> we are responsible for setting the object's position and
dimensions accordingly.</p>

<p>You can also add sprites by using the surface's add method:</p>

<pre><code>drawComponent.surface.add({
    type: 'circle',
    fill: '#79BB3F',
    radius: 100,
    x: 100,
    y: 100
});
</code></pre>

<h2>Larger example</h2>

<pre class='inline-example '><code>var drawComponent = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>', {
    width: 800,
    height: 600,
    renderTo: document.body
}), surface = drawComponent.surface;

surface.add([{
    type: 'circle',
    radius: 10,
    fill: '#f00',
    x: 10,
    y: 10,
    group: 'circles'
}, {
    type: 'circle',
    radius: 10,
    fill: '#0f0',
    x: 50,
    y: 50,
    group: 'circles'
}, {
    type: 'circle',
    radius: 10,
    fill: '#00f',
    x: 100,
    y: 100,
    group: 'circles'
}, {
    type: 'rect',
    width: 20,
    height: 20,
    fill: '#f00',
    x: 10,
    y: 10,
    group: 'rectangles'
}, {
    type: 'rect',
    width: 20,
    height: 20,
    fill: '#0f0',
    x: 50,
    y: 50,
    group: 'rectangles'
}, {
    type: 'rect',
    width: 20,
    height: 20,
    fill: '#00f',
    x: 100,
    y: 100,
    group: 'rectangles'
}]);

// Get references to my groups
circles = surface.getGroup('circles');
rectangles = surface.getGroup('rectangles');

// Animate the circles down
circles.animate({
    duration: 1000,
    to: {
        translate: {
            y: 200
        }
    }
});

// Animate the rectangles across
rectangles.animate({
    duration: 1000,
    to: {
        translate: {
            x: 200
        }
    }
});
</code></pre>

<p>For more information on Sprites, the core elements added to a draw component's surface,
refer to the <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a> documentation.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method surface : Ext_draw_Surface.t Js.t Js.prop
  (** {% <p>The Surface instance managed by this component.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method autoSize : bool Js.t Js.prop
  (** {% <p>Turn on autoSize support which will set the bounding div's size to the natural size of the contents.</p> %}
    
    Defaults to: [false]
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this components's element. This will also be prepended to elements within this
component like Panel's body will get a class x-panel-body. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the baseCls x-panel and use
componentCls to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'surface']
    *)
  method componentLayout : _ Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.draw.Component-method-setSize" rel="Ext.draw.Component-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['draw']
    *)
  method enginePriority : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>Defines the priority order for which Surface implementation to use. The first
one supported by the current environment will be used.</p> %}
    
    Defaults to: [['Svg', 'Vml']]
    *)
  method gradients : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>(optional) Define a set of gradients that can be used as <code>fill</code> property in sprites.
The gradients array is an array of objects with the following properties:</p>

<ul>
<li><code>id</code> - string - The unique name of the gradient.</li>
<li><code>angle</code> - number, optional - The angle of the gradient in degrees.</li>
<li><code>stops</code> - object - An object with numbers as keys (from 0 to 100) and style objects as values</li>
</ul>


<h2>Example</h2>

<pre><code>gradients: [{
    id: 'gradientId',
    angle: 45,
    stops: {
        0: {
            color: '#555'
        },
        100: {
            color: '#ddd'
        }
    }
}, {
    id: 'gradientId2',
    angle: 0,
    stops: {
        0: {
            color: '#590'
        },
        20: {
            color: '#599'
        },
        100: {
            color: '#ddd'
        }
    }
}]
</code></pre>

<p>Then the sprites can use <code>gradientId</code> and <code>gradientId2</code> by setting the fill attributes to those ids, for example:</p>

<pre><code>sprite.setAttributes({
    fill: 'url(#gradientId)'
}, true);
</code></pre> %}
    *)
  method items : Ext_draw_Sprite.t Js.js_array Js.t Js.prop
  (** {% <p>Array of sprites or sprite config objects to add initially to the surface.</p> %}
    *)
  method shrinkWrap : _ Js.t Js.prop
  (** {% <p>If this property is a number, it is interpreted as follows:</p>

<ul>
<li>0: Neither width nor height depend on content. This is equivalent to <code>false</code>.</li>
<li>1: Width depends on content (shrink wraps), but height does not.</li>
<li>2: Height depends on content (shrink wraps), but width does not. The default.</li>
<li>3: Both width and height depend on content (shrink wrap). This is equivalent to <code>true</code>.</li>
</ul>


<p>In CSS terms, shrink-wrap width is analogous to an inline-block element as opposed
to a block-level element. Some container layouts always shrink-wrap their children,
effectively ignoring this property (e.g., <a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">Ext.layout.container.HBox</a>,
<a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">Ext.layout.container.VBox</a>, <a href="#!/api/Ext.layout.component.Dock" rel="Ext.layout.component.Dock" class="docClass">Ext.layout.component.Dock</a>).</p> %}
    
    Defaults to: [3]
    *)
  method viewBox : bool Js.t Js.prop
  (** {% <p>Turn on view box support which will scale and position items in the draw component to fit to the component while
maintaining aspect ratio. Note that this scaling can override other sizing settings on your items.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  method click : (Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a click is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a dblclick is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a mousedown is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a mouseenter is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a mouseleave is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a mousemove is detected within the surface.</p> %}
    
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
  (** {% <p>Event forwarded from <a href="#!/api/Ext.draw.Surface" rel="Ext.draw.Surface" class="docClass">surface</a>.</p>

<p>Fires when a mouseup is detected within the surface.</p> %}
    
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
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

