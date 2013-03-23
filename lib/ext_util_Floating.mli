(** A mixin to add floating capability to a Component. ...
  
  {% <p>A mixin to add floating capability to a Component.</p> %} *)

class type t =
object('self)
  inherit Ext_Base.t
  
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
  
  method constrain : bool Js.t Js.prop
  (** {% <p>True to constrain this Components within its containing element, false to allow it to fall outside of its containing
element. By default this Component will be rendered to <code>document.body</code>. To render and constrain this Component within
another element specify <a href="#!/api/Ext.AbstractComponent-cfg-renderTo" rel="Ext.AbstractComponent-cfg-renderTo" class="docClass">renderTo</a>.</p> %}
    
    Defaults to: [false]
    *)
  method fixed : bool Js.t Js.prop
  (** {% <p>Configure as <code>true</code> to have this Component fixed at its <code>X, Y</code> coordinates in the browser viewport, immune
to scrolling the document.</p>

<p><em>Only in browsers that support <code>position:fixed</code></em></p>

<p><em>IE6 and IE7, 8 and 9 quirks do not support <code>position: fixed</code></em></p> %}
    
    Defaults to: [false]
    *)
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
  method shadowOffset : Js.number Js.t Js.prop
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

