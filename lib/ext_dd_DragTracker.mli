(** A DragTracker listens for drag events on an Elemen ...
  
  {% <p>A DragTracker listens for drag events on an Element and fires events at the start and end of the drag,
as well as during the drag. This is useful for components such as <a href="#!/api/Ext.slider.Multi" rel="Ext.slider.Multi" class="docClass">Ext.slider.Multi</a>, where there is
an element that can be dragged around to change the Slider's value.</p>

<p>DragTracker provides a series of template methods that should be overridden to provide functionality
in response to detected drag operations. These are onBeforeStart, onStart, onDrag and onEnd.
See <a href="#!/api/Ext.slider.Multi" rel="Ext.slider.Multi" class="docClass">Ext.slider.Multi</a>'s initEvents function for an example implementation.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method active : bool Js.t Js.readonly_prop
  (** {% <p>Indicates whether the user is currently dragging this tracker.</p> %}
    
    Defaults to: [false]
    *)
  method dragTarget : Dom_html.element Js.t Js.readonly_prop
  (** {% <p>The element being dragged.</p>

<p>Only valid during drag operations.</p>

<p>If the <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> option is used, this will be the delegate element which was mousedowned.</p> %}
    *)
  method getDragTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the drag target. This is usually the DragTracker's encapsulating element.</p>

<p>If the <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> option is being used, this may be a child element which matches the
<a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> selector.</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t]
    {% <p>The element currently being tracked.</p> %}
    }
    }
    *)
  method getOffset : Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Returns the X, Y offset of the current mouse position from the mousedown point.</p>

<p>This method may optionally constrain the real offset values, and returns a point coerced in one
of two modes:</p>

<ul>
<li><code>point</code>
The current mouse position is coerced into the constrainRegion and the resulting position is returned.</li>
<li><code>dragTarget</code>
The new <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Region</a> of the <a href="#!/api/Ext.dd.DragTracker-method-getDragTarget" rel="Ext.dd.DragTracker-method-getDragTarget" class="docClass">dragTarget</a> is calculated
based upon the current mouse position, and then coerced into the constrainRegion. The returned
mouse position is then adjusted by the same delta as was used to coerce the region.\</li>
</ul> %}
    
    {b Parameters}:
    {ul {- constrainMode: [Js.js_string Js.t] (optional)
    {% <p>If omitted the true mouse position is returned. May be passed
as <code>point</code> or <code>dragTarget</code>. See above.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The <code>X, Y</code> offset from the mousedown point, optionally constrained.</p> %}
    }
    }
    *)
  method initEl : _ Js.t -> unit Js.meth
  (** {% <p>Initializes the DragTracker on a given element.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t] {% <p>The element</p> %}
    }
    }
    *)
  method onBeforeStart : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called when the user first clicks and
holds the mouse button down. Return false to disallow the drag</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  method onDrag : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called whenever a drag has been detected.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  method onEnd : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called when a drag operation has been completed
(e.g. the user clicked and held the mouse down, dragged the element and then released the mouse button)</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  method onStart : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Template method which should be overridden by each DragTracker instance. Called when a drag operation starts
(e.g. the user has moved the tracked element beyond the specified tolerance)</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t] {% <p>The event object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method autoStart : _ Js.t Js.prop
  (** {% <p>Specify <code>true</code> to defer trigger start by 1000 ms.
Specify a Number for the number of milliseconds to defer trigger start.</p> %}
    
    Defaults to: [false]
    *)
  method constrainTo : _ Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Region</a> (Or an element from which a Region measurement will be read)
which is used to constrain the result of the <a href="#!/api/Ext.dd.DragTracker-method-getOffset" rel="Ext.dd.DragTracker-method-getOffset" class="docClass">getOffset</a> call.</p>

<p>This may be set any time during the DragTracker's lifecycle to set a dynamic constraining region.</p> %}
    *)
  method delegate : Js.js_string Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">DomQuery</a> selector which identifies child elements within the DragTracker's encapsulating
Element which are the tracked elements. This limits tracking to only begin when the matching elements are mousedowned.</p>

<p>This may also be a specific child element within the DragTracker's encapsulating element to use as the tracked element.</p> %}
    *)
  method overCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to add to the DragTracker's target element when the element (or, if the <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a>
option is used, when a delegate element) is mouseovered.</p>

<p>If the <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> option is used, these events fire only when a delegate element is entered of left.</p> %}
    *)
  method preventDefault : bool Js.t Js.prop
  (** {% <p>Specify <code>false</code> to enable default actions on onMouseDown events.</p> %}
    
    Defaults to: [true]
    *)
  method stopEvent : bool Js.t Js.prop
  (** {% <p>Specify <code>true</code> to stop the <code>mousedown</code> event from bubbling to outer listeners from the target element (or its delegates).</p> %}
    
    Defaults to: [false]
    *)
  method tolerance : Js.number Js.t Js.prop
  (** {% <p>Number of pixels the drag target must be moved before dragging is
considered to have started.</p> %}
    
    Defaults to: [5]
    *)
  method trackOver : bool Js.t Js.prop
  (** {% <p>Set to true to fire mouseover and mouseout events when the mouse enters or leaves the target element.</p>

<p>This is implicitly set when an <a href="#!/api/Ext.dd.DragTracker-cfg-overCls" rel="Ext.dd.DragTracker-cfg-overCls" class="docClass">overCls</a> is specified.</p>

<p>If the <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> option is used, these events fire only when a delegate element is entered of left.</p> %}
    
    Defaults to: [false]
    *)
  method onBeforeStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onBeforeStart] *)
  method onDrag : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onDrag] *)
  method onEnd : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onEnd] *)
  method onStart : ('self Js.t, Ext_EventObject.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onStart] *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforestart : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method drag : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dragend : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method dragstart : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method mousedown : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the mouse button is pressed down, but before a drag operation begins. The
drag operation begins after either the mouse has been moved by <a href="#!/api/Ext.dd.DragTracker-cfg-tolerance" rel="Ext.dd.DragTracker-cfg-tolerance" class="docClass">tolerance</a> pixels,
or after the <a href="#!/api/Ext.dd.DragTracker-cfg-autoStart" rel="Ext.dd.DragTracker-cfg-autoStart" class="docClass">autoStart</a> timer fires.</p>

<p>Return <code>false</code> to veto the drag operation.</p> %}
    
    {b Parameters}:
    {ul {- this: [_ Js.t]
    }
    {- e: [_ Js.t] {% <p>event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mousemove : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when the mouse is moved. Returning false cancels the drag operation.</p> %}
    
    {b Parameters}:
    {ul {- this: [_ Js.t]
    }
    {- e: [_ Js.t] {% <p>event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseout : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the mouse exits the DragTracker's target element (or if <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> is
used, when the mouse exits a delegate element).</p>

<p><strong>Only available when <a href="#!/api/Ext.dd.DragTracker-cfg-trackOver" rel="Ext.dd.DragTracker-cfg-trackOver" class="docClass">trackOver</a> is <code>true</code></strong></p> %}
    
    {b Parameters}:
    {ul {- this: [_ Js.t]
    }
    {- e: [_ Js.t] {% <p>event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (_ Js.t -> _ Js.t -> Dom_html.element Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse enters the DragTracker's target element (or if <a href="#!/api/Ext.dd.DragTracker-cfg-delegate" rel="Ext.dd.DragTracker-cfg-delegate" class="docClass">delegate</a> is
used, when the mouse enters a delegate element).</p>

<p><strong>Only available when <a href="#!/api/Ext.dd.DragTracker-cfg-trackOver" rel="Ext.dd.DragTracker-cfg-trackOver" class="docClass">trackOver</a> is <code>true</code></strong></p> %}
    
    {b Parameters}:
    {ul {- this: [_ Js.t]
    }
    {- e: [_ Js.t]
    {% <p>event object</p> %}
    }
    {- target: [Dom_html.element Js.t]
    {% <p>The element mouseovered.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseup : (_ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

