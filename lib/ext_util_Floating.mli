(** A mixin to add floating capability to a Component. ...
  
  {% <p>A mixin to add floating capability to a Component.</p> %} *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method alignTo : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Aligns this floating Component to the specified element</p> %}
    
    {b Parameters}:
    {ul {- element: [_ Js.t]
    {% <p>The element or <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to align to. If passing a component, it must be a
component instance. If a string id is passed, it will be used as an element id.</p> %}
    }
    {- position: [Js.js_string Js.t] (optional)
    {% <p>The position to align to
(see <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.Element.alignTo</a> for more details).</p> %}
    
    Defaults to: "tl-bl?"
    }
    {- offsets: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>Offset the positioning by [x, y]</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method center : _ Js.t Js.meth
  (** {% <p>Center this Component in its container.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method doConstrain : _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Moves this floating Component into a constrain region.</p>

<p>By default, this Component is constrained to be within the container it was added to, or the element it was
rendered to.</p>

<p>An alternative constraint may be passed.</p> %}
    
    {b Parameters}:
    {ul {- constrainTo: [_ Js.t] (optional)
    {% <p>The Element or <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Region</a>
into which this Component is to be constrained. Defaults to the element into which this floating Component
was rendered.</p> %}
    }
    }
    *)
  method setActive : bool Js.t Js.optdef -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>This method is called internally by <a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">Ext.ZIndexManager</a> to signal that a floating Component has either been
moved to the top of its zIndex stack, or pushed from the top of its zIndex stack.</p>

<p>If a <em>Window</em> is superceded by another Window, deactivating it hides its shadow.</p>

<p>This method also fires the <a href="#!/api/Ext.Component-event-activate" rel="Ext.Component-event-activate" class="docClass">activate</a> or
<a href="#!/api/Ext.Component-event-deactivate" rel="Ext.Component-event-deactivate" class="docClass">deactivate</a> event depending on which action occurred.</p> %}
    
    {b Parameters}:
    {ul {- active: [bool Js.t] (optional)
    {% <p>True to activate the Component, false to deactivate it.</p> %}
     Defaults to: false
    }
    {- newActive: [#Ext_Component.t Js.t] (optional)
    {% <p>The newly active Component which is taking over topmost zIndex position.</p> %}
    }
    }
    *)
  method toBack : _ Js.t Js.meth
  (** {% <p>Sends this Component to the back of (lower z-index than) any other visible windows</p> %}
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method toFront : bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Brings this floating Component to the front of any other visible, floating Components managed by the same
<a href="#!/api/Ext.ZIndexManager" rel="Ext.ZIndexManager" class="docClass">ZIndexManager</a></p>

<p>If this Component is modal, inserts the modal mask just below this Component in the z-index stack.</p> %}
    
    {b Parameters}:
    {ul {- preventFocus: [bool Js.t] (optional)
    {% <p>Specify <code>true</code> to prevent the Component from being focused.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method focusOnToFront : bool Js.t Js.prop
  (** {% <p>Specifies whether the floated component should be automatically <a href="#!/api/Ext.Component-method-focus" rel="Ext.Component-method-focus" class="docClass">focused</a> when
it is <a href="#!/api/Ext.util.Floating-method-toFront" rel="Ext.util.Floating-method-toFront" class="docClass">brought to the front</a>.</p> %}
    
    Defaults to: [true]
    *)
  method shadow : _ Js.t Js.prop
  (** {% <p>Specifies whether the floating component should be given a shadow. Set to true to automatically create an
<a href="#!/api/Ext.Shadow" rel="Ext.Shadow" class="docClass">Ext.Shadow</a>, or a string indicating the shadow's display <a href="#!/api/Ext.Shadow-cfg-mode" rel="Ext.Shadow-cfg-mode" class="docClass">Ext.Shadow.mode</a>. Set to false to
disable the shadow.</p> %}
    
    Defaults to: ['sides']
    *)
  method shadowOffset : _ Js.t Js.prop
  (** {% <p>Number of pixels to offset the shadow.</p> %}
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

