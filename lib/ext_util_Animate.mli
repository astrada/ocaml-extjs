(** This animation class is a mixin.Ext.util.Animate p ...
  
  {% <p>This animation class is a mixin.</p>

<p><a href="#!/api/Ext.util.Animate" rel="Ext.util.Animate" class="docClass">Ext.util.Animate</a> provides an API for the creation of animated transitions of properties and styles.
This class is used as a mixin and currently applied to <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>, <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">Ext.CompositeElement</a>,
<a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Ext.draw.Sprite</a>, <a href="#!/api/Ext.draw.CompositeSprite" rel="Ext.draw.CompositeSprite" class="docClass">Ext.draw.CompositeSprite</a>, and <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.  Note that Components
have a limited subset of what attributes can be animated such as top, left, x, y, height, width, and
opacity (color, paddings, and margins can not be animated).</p>

<h2>Animation Basics</h2>

<p>All animations require three things - <code>easing</code>, <code>duration</code>, and <code>to</code> (the final end value for each property)
you wish to animate. Easing and duration are defaulted values specified below.
Easing describes how the intermediate values used during a transition will be calculated.
<a href="#!/api/Ext.fx.Anim-cfg-easing" rel="Ext.fx.Anim-cfg-easing" class="docClass">Easing</a> allows for a transition to change speed over its duration.
You may use the defaults for easing and duration, but you must always set a
<a href="#!/api/Ext.fx.Anim-cfg-to" rel="Ext.fx.Anim-cfg-to" class="docClass">to</a> property which is the end value for all animations.</p>

<p>Popular element 'to' configurations are:</p>

<ul>
<li>opacity</li>
<li>x</li>
<li>y</li>
<li>color</li>
<li>height</li>
<li>width</li>
</ul>


<p>Popular sprite 'to' configurations are:</p>

<ul>
<li>translation</li>
<li>path</li>
<li>scale</li>
<li>stroke</li>
<li>rotation</li>
</ul>


<p>The default duration for animations is 250 (which is a 1/4 of a second).  Duration is denoted in
milliseconds.  Therefore 1 second is 1000, 1 minute would be 60000, and so on. The default easing curve
used for all animations is 'ease'.  Popular easing functions are included and can be found in <a href="#!/api/Ext.fx.Anim-cfg-easing" rel="Ext.fx.Anim-cfg-easing" class="docClass">Easing</a>.</p>

<p>For example, a simple animation to fade out an element with a default easing and duration:</p>

<pre><code>var p1 = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('myElementId');

p1.animate({
    to: {
        opacity: 0
    }
});
</code></pre>

<p>To make this animation fade out in a tenth of a second:</p>

<pre><code>var p1 = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('myElementId');

p1.animate({
   duration: 100,
    to: {
        opacity: 0
    }
});
</code></pre>

<h2>Animation Queues</h2>

<p>By default all animations are added to a queue which allows for animation via a chain-style API.
For example, the following code will queue 4 animations which occur sequentially (one right after the other):</p>

<pre><code>p1.animate({
    to: {
        x: 500
    }
}).animate({
    to: {
        y: 150
    }
}).animate({
    to: {
        backgroundColor: '#f00'  //red
    }
}).animate({
    to: {
        opacity: 0
    }
});
</code></pre>

<p>You can change this behavior by calling the <a href="#!/api/Ext.util.Animate-method-syncFx" rel="Ext.util.Animate-method-syncFx" class="docClass">syncFx</a> method and all
subsequent animations for the specified target will be run concurrently (at the same time).</p>

<pre><code>p1.syncFx();  //this will make all animations run at the same time

p1.animate({
    to: {
        x: 500
    }
}).animate({
    to: {
        y: 150
    }
}).animate({
    to: {
        backgroundColor: '#f00'  //red
    }
}).animate({
    to: {
        opacity: 0
    }
});
</code></pre>

<p>This works the same as:</p>

<pre><code>p1.animate({
    to: {
        x: 500,
        y: 150,
        backgroundColor: '#f00'  //red
        opacity: 0
    }
});
</code></pre>

<p>The <a href="#!/api/Ext.util.Animate-method-stopAnimation" rel="Ext.util.Animate-method-stopAnimation" class="docClass">stopAnimation</a> method can be used to stop any
currently running animations and clear any queued animations.</p>

<h2>Animation Keyframes</h2>

<p>You can also set up complex animations with <a href="#!/api/Ext.fx.Anim-cfg-keyframes" rel="Ext.fx.Anim-cfg-keyframes" class="docClass">keyframes</a> which follow the
CSS3 Animation configuration pattern. Note rotation, translation, and scaling can only be done for sprites.
The previous example can be written with the following syntax:</p>

<pre><code>p1.animate({
    duration: 1000,  //one second total
    keyframes: {
        25: {     //from 0 to 250ms (25%)
            x: 0
        },
        50: {   //from 250ms to 500ms (50%)
            y: 0
        },
        75: {  //from 500ms to 750ms (75%)
            backgroundColor: '#f00'  //red
        },
        100: {  //from 750ms to 1sec
            opacity: 0
        }
    }
});
</code></pre>

<h2>Animation Events</h2>

<p>Each animation you create has events for <a href="#!/api/Ext.fx.Anim-event-beforeanimate" rel="Ext.fx.Anim-event-beforeanimate" class="docClass">beforeanimate</a>,
<a href="#!/api/Ext.fx.Anim-event-afteranimate" rel="Ext.fx.Anim-event-afteranimate" class="docClass">afteranimate</a>, and <a href="#!/api/Ext.fx.Anim-event-lastframe" rel="Ext.fx.Anim-event-lastframe" class="docClass">lastframe</a>.
Keyframed animations adds an additional <a href="#!/api/Ext.fx.Animator-event-keyframe" rel="Ext.fx.Animator-event-keyframe" class="docClass">keyframe</a> event which
fires for each keyframe in your animation.</p>

<p>All animations support the <a href="#!/api/Ext.util.Observable-cfg-listeners" rel="Ext.util.Observable-cfg-listeners" class="docClass">listeners</a> configuration to attact functions to these events.</p>

<pre><code>startAnimate: function() {
    var p1 = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('myElementId');
    p1.animate({
       duration: 100,
        to: {
            opacity: 0
        },
        listeners: {
            beforeanimate:  function() {
                // Execute my custom method before the animation
                this.myBeforeAnimateFn();
            },
            afteranimate: function() {
                // Execute my custom method after the animation
                this.myAfterAnimateFn();
            },
            scope: this
    });
},
myBeforeAnimateFn: function() {
  // My custom logic
},
myAfterAnimateFn: function() {
  // My custom logic
}
</code></pre>

<p>Due to the fact that animations run asynchronously, you can determine if an animation is currently
running on any target by using the <a href="#!/api/Ext.util.Animate-method-getActiveAnimation" rel="Ext.util.Animate-method-getActiveAnimation" class="docClass">getActiveAnimation</a>
method.  This method will return false if there are no active animations or return the currently
running <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a> instance.</p>

<p>In this example, we're going to wait for the current animation to finish, then stop any other
queued animations before we fade our element's opacity to 0:</p>

<pre><code>var curAnim = p1.getActiveAnimation();
if (curAnim) {
    curAnim.on('afteranimate', function() {
        p1.stopAnimation();
        p1.animate({
            to: {
                opacity: 0
            }
        });
    });
}
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method animate : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Performs custom animation on this object.</p>

<p>This method is applicable to both the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> class and the <a href="#!/api/Ext.draw.Sprite" rel="Ext.draw.Sprite" class="docClass">Sprite</a>
class. It performs animated transitions of certain properties of this object over a specified timeline.</p>

<h3>Animating a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a></h3>

<p>When animating a Component, the following properties may be specified in <code>from</code>, <code>to</code>, and <code>keyframe</code> objects:</p>

<ul>
<li><p><code>x</code> - The Component's page X position in pixels.</p></li>
<li><p><code>y</code> - The Component's page Y position in pixels</p></li>
<li><p><code>left</code> - The Component's <code>left</code> value in pixels.</p></li>
<li><p><code>top</code> - The Component's <code>top</code> value in pixels.</p></li>
<li><p><code>width</code> - The Component's <code>width</code> value in pixels.</p></li>
<li><p><code>width</code> - The Component's <code>width</code> value in pixels.</p></li>
<li><p><code>dynamic</code> - Specify as true to update the Component's layout (if it is a Container) at every frame of the animation.
<em>Use sparingly as laying out on every intermediate size change is an expensive operation.</em></p></li>
</ul>


<p>For example, to animate a Window to a new size, ensuring that its internal layout and any shadow is correct:</p>

<pre><code>myWindow = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>', {
    title: 'Test Component animation',
    width: 500,
    height: 300,
    layout: {
        type: 'hbox',
        align: 'stretch'
    },
    items: [{
        title: 'Left: 33%',
        margins: '5 0 5 5',
        flex: 1
    }, {
        title: 'Left: 66%',
        margins: '5 5 5 5',
        flex: 2
    }]
});
myWindow.show();
myWindow.header.el.on('click', function() {
    myWindow.animate({
        to: {
            width: (myWindow.getWidth() == 500) ? 700 : 500,
            height: (myWindow.getHeight() == 300) ? 400 : 300
        }
    });
});
</code></pre>

<p>For performance reasons, by default, the internal layout is only updated when the Window reaches its final <code>"to"</code>
size. If dynamic updating of the Window's child Components is required, then configure the animation with
<code>dynamic: true</code> and the two child items will maintain their proportions during the animation.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>Configuration for <a href="#!/api/Ext.fx.Anim" rel="Ext.fx.Anim" class="docClass">Ext.fx.Anim</a>.
Note that the <a href="#!/api/Ext.fx.Anim-cfg-to" rel="Ext.fx.Anim-cfg-to" class="docClass">to</a> config is required.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>this</p> %}
    }
    }
    *)
  method getActiveAnimation : _ Js.t Js.meth
  (** {% <p>Returns the current animation if this object has any effects actively running or queued, else returns false.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>Anim if element has active effects, else false</p> %}
    }
    }
    *)
  method sequenceFx : _ Js.t Js.meth
  (** {% <p>Ensures that all effects queued after sequenceFx is called on this object are run in sequence. This is the
opposite of <a href="#!/api/Ext.util.Animate-method-syncFx" rel="Ext.util.Animate-method-syncFx" class="docClass">syncFx</a>.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>this</p> %}
    }
    }
    *)
  method stopAnimation : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Stops any running effects and clears this object's internal effects queue if it contains any additional effects
that haven't started yet.</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>The Element</p> %}
    }
    }
    *)
  method syncFx : _ Js.t Js.meth
  (** {% <p>Ensures that all effects queued after syncFx is called on this object are run concurrently. This is the opposite
of <a href="#!/api/Ext.util.Animate-method-sequenceFx" rel="Ext.util.Animate-method-sequenceFx" class="docClass">sequenceFx</a>.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>this</p> %}
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

