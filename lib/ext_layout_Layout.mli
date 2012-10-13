(** Base Layout class - extended by ComponentLayout an ...
  
  {% <p>Base Layout class - extended by ComponentLayout and ContainerLayout</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method done_ : bool Js.t Js.prop
  (** {% <p>Used only during a layout run, this value indicates that a
layout has finished its calculations. This flag is set to true prior to the call to
<a href="#!/api/Ext.layout.Layout-method-calculate" rel="Ext.layout.Layout-method-calculate" class="docClass">calculate</a> and should be set to false if this layout has more work to do.</p> %}
    *)
  method isLayout : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Layout, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method afterRemove : 'a Js.t -> unit Js.meth
  (** {% <p>Removes layout's itemCls and owning Container's itemCls.
Clears the managed dimensions flags</p> %}
    
    {b Parameters}:
    {ul {- item: ['a Js.t]
    }
    }
    *)
  method beginLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>Called before any calculation cycles to prepare for layout.</p>

<p>This is a write phase and DOM reads should be strictly avoided when overridding
this method.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>Called before any calculation cycles to reset DOM values and prepare for calculation.</p>

<p>This is a write phase and DOM reads should be strictly avoided when overridding
this method.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method calculate : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>Called to perform the calculations for this layout. This method will be called at
least once and may be called repeatedly if the <a href="#!/api/Ext.layout.Layout-property-done" rel="Ext.layout.Layout-property-done" class="docClass">done</a> property is cleared
before return to indicate that this layout is not yet done. The <a href="#!/api/Ext.layout.Layout-property-done" rel="Ext.layout.Layout-property-done" class="docClass">done</a> property
is always set to <code>true</code> before entering this method.</p>

<p>This is a read phase and DOM writes should be strictly avoided in derived classes.
Instead, DOM writes need to be written to <a href="#!/api/Ext.layout.ContextItem" rel="Ext.layout.ContextItem" class="docClass">Ext.layout.ContextItem</a> objects to
 be flushed at the next opportunity.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method completeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>This method (if implemented) is called at the end of the cycle in which this layout
completes (by not setting <a href="#!/api/Ext.layout.Layout-property-done" rel="Ext.layout.Layout-property-done" class="docClass">done</a> to <code>false</code> in <a href="#!/api/Ext.layout.Layout-method-calculate" rel="Ext.layout.Layout-method-calculate" class="docClass">calculate</a>). It is
possible for the layout to complete and yet become invalid before the end of the cycle,
in which case, this method will not be called. It is also possible for this method to
be called and then later the layout becomes invalidated. This will result in
<a href="#!/api/Ext.layout.Layout-method-calculate" rel="Ext.layout.Layout-method-calculate" class="docClass">calculate</a> being called again, followed by another call to this method.</p>

<p>This is a read phase and DOM writes should be strictly avoided in derived classes.
Instead, DOM writes need to be written to <a href="#!/api/Ext.layout.ContextItem" rel="Ext.layout.ContextItem" class="docClass">Ext.layout.ContextItem</a> objects to
be flushed at the next opportunity.</p>

<p>This method need not be implemented by derived classes and, in fact, should only be
implemented when needed.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method configureItem : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>Called before an item is rendered to allow the layout to configure the item.</p> %}
    
    {b Parameters}:
    {ul {- item: [#Ext_Component.t Js.t]
    {% <p>The item to be configured</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys this layout. This method removes a <code>targetCls</code> from the <code>target</code>
element and calls <code>onDestroy</code>.</p>

<p>A derived class can override either this method or <code>onDestroy</code> but in all
cases must call the base class versions of these methods to allow the base class to
perform its cleanup.</p>

<p>This method (or <code>onDestroy</code>) are overridden by subclasses most often to purge
event handlers or remove unmanged DOM nodes.</p> %}
    *)
  method finalizeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>This method (if implemented) is called after all layouts have completed. In most
ways this is similar to <a href="#!/api/Ext.layout.Layout-method-completeLayout" rel="Ext.layout.Layout-method-completeLayout" class="docClass">completeLayout</a>. This call can cause this (or any
layout) to be become invalid (see <a href="#!/api/Ext.layout.Context-method-invalidate" rel="Ext.layout.Context-method-invalidate" class="docClass">Ext.layout.Context.invalidate</a>), but this
is best avoided. This method is intended to be where final reads are made and so it
is best to avoid invalidating layouts at this point whenever possible. Even so, this
method can be used to perform final checks that may require all other layouts to be
complete and then invalidate some results.</p>

<p>This is a read phase and DOM writes should be strictly avoided in derived classes.
Instead, DOM writes need to be written to <a href="#!/api/Ext.layout.ContextItem" rel="Ext.layout.ContextItem" class="docClass">Ext.layout.ContextItem</a> objects to
be flushed at the next opportunity.</p>

<p>This method need not be implemented by derived classes and, in fact, should only be
implemented when needed.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method finishedLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>This method is called after all layouts are complete and their calculations flushed
to the DOM. No further layouts will be run and this method is only called once per
layout run. The base component layout caches <code>lastComponentSize</code>.</p>

<p>This is a write phase and DOM reads should be avoided if possible when overridding
this method.</p>

<p>This method need not be implemented by derived classes and, in fact, should only be
implemented when needed.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method getItemSizePolicy : #Ext_Component.t Js.t -> 'a Js.t Js.meth
  (** {% <p>Returns an object describing how this layout manages the size of the given component.
This method must be implemented by any layout that manages components.</p> %}
    
    {b Parameters}:
    {ul {- item: [#Ext_Component.t Js.t]
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>An object describing the sizing done by the layout for this item or
null if the layout mimics the size policy of its ownerCt (e.g., 'fit' and 'card').</p> %}
    }
    }
    *)
  method getLayoutItems_2 : unit Js.meth
  (** {% <p>Returns the set of items to layout (empty by default).</p> %}
    *)
  method initLayout : unit Js.meth
  (** {% <p>A one-time initialization method called just before rendering.</p> %}
    *)
  method isValidParent : 'a Js.t -> 'b Js.t -> 'c Js.t -> unit Js.meth
  (** {% <p>Validates item is in the proper place in the dom.</p> %}
    
    {b Parameters}:
    {ul {- item: ['a Js.t]
    }
    {- target: ['a Js.t]
    }
    {- position: ['a Js.t]
    }
    }
    *)
  method notifyOwner : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>This method (if implemented) is called after all layouts are finished, and all have
a <code>lastComponentSize</code> cached. No further layouts will be run and this method is only
called once per layout run. It is the bookend to <a href="#!/api/Ext.layout.Layout-method-beginLayout" rel="Ext.layout.Layout-method-beginLayout" class="docClass">beginLayout</a>.</p>

<p>This is a write phase and DOM reads should be avoided if possible when overridding
this method. This is the catch-all tail method to a layout and so the rules are more
relaxed. Even so, for performance reasons, it is best to avoid reading the DOM. If
a read is necessary, consider implementing a <a href="#!/api/Ext.layout.Layout-method-finalizeLayout" rel="Ext.layout.Layout-method-finalizeLayout" class="docClass">finalizeLayout</a> method to do the
required reads.</p>

<p>This method need not be implemented by derived classes and, in fact, should only be
implemented when needed.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method onContentChange : #Ext_Component.t Js.t -> bool Js.t Js.meth
  (** {% <p>This method is called when a child item changes in some way. By default this calls
<a href="#!/api/Ext.AbstractComponent-method-updateLayout" rel="Ext.AbstractComponent-method-updateLayout" class="docClass">Ext.AbstractComponent.updateLayout</a> on this layout's owner.</p> %}
    
    {b Parameters}:
    {ul {- child: [#Ext_Component.t Js.t]
    {% <p>The child item that has changed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this layout has handled the content change.</p> %}
    }
    }
    *)
  method renderItems : 'a Js.t -> 'b Js.t -> unit Js.meth
  (** {% <p>Iterates over all passed items, ensuring they are rendered.  If the items are already rendered,
also determines if the items are in the proper place in the dom.</p> %}
    
    {b Parameters}:
    {ul {- items: ['a Js.t]
    }
    {- target: ['a Js.t]
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

