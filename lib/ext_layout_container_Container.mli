(** This class is intended to be extended or created v ...
  
  {% <p>This class is intended to be extended or created via the <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a>
configuration property.  See <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">Ext.container.Container.layout</a> for additional details.</p> %}
  *)

class type t =
object('self)
  inherit Ext_util_ElementContainer.t
  inherit Ext_layout_Layout.t
  
  method beginLayout_obj : _ Js.t -> unit Js.meth
  (** {% <p>In addition to work done by our base classes, containers benefit from some extra
cached data. The following properties are added to the ownerContext:</p>

<ul>
<li>visibleItems: the result of <a href="#!/api/Ext.layout.container.Container-method-getVisibleItems" rel="Ext.layout.container.Container-method-getVisibleItems" class="docClass">getVisibleItems</a></li>
<li>childItems: the ContextItem[] for each visible item</li>
<li>targetContext: the ContextItem for the <a href="#!/api/Ext.layout.container.Container-method-getTarget" rel="Ext.layout.container.Container-method-getTarget" class="docClass">getTarget</a> element</li>
</ul> %}
    
    {b Parameters}:
    {ul {- ownerContext: [_ Js.t]
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
  method configureItem_obj : _ Js.t -> unit Js.meth
  (** {% <p>Adds layout's itemCls and owning Container's itemCls</p> %}
    
    {b Parameters}:
    {ul {- item: [_ Js.t]
    }
    }
    *)
  method getContainerSize : Ext_layout_ContextItem.t Js.t ->
    bool Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Returns the container size (that of the target). Only the fixed-sized dimensions can
be returned because the shrinkWrap dimensions are based on the contentWidth/Height
as determined by the container layout.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The owner's context item.</p> %}
    }
    {- inDom: [bool Js.t] (optional)
    {% <p>True if the container size must be in the DOM.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The size</p> %}
    }
    }
    *)
  method getElementTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the element into which extra functional DOM elements can be inserted. Defaults to the owner Component's encapsulating element.</p>

<p>May be overridden in Component layout managers which implement a <a href="#!/api/Ext.layout.container.Container-method-getRenderTarget" rel="Ext.layout.container.Container-method-getRenderTarget" class="docClass">component render target</a> which must only
contain child components.</p> %}
    *)
  method getLayoutItems : Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of child components either for a render phase (Performed in the beforeLayout
method of the layout's base class), or the layout phase (onLayout).</p> %}
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>of child components</p> %}
    }
    }
    *)
  method getRenderTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the element into which rendering must take place. Defaults to the owner Container's
target element.</p>

<p>May be overridden in layout managers which implement an inner element.</p> %}
    *)
  method getRenderedItems : _ Js.js_array Js.t Js.meth
  (** {% <p>Returns all items that are rendered</p> %}
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>All matching items</p> %}
    }
    }
    *)
  method getTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the owner component's resize element.</p> %}
    *)
  method getVisibleItems : _ Js.js_array Js.t Js.meth
  (** {% <p>Returns all items that are both rendered and visible</p> %}
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>All matching items</p> %}
    }
    }
    *)
  method overflowPadderEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The element used to correct body padding during overflow.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_util_ElementContainer.configs
  inherit Ext_layout_Layout.configs
  
  method itemCls : Js.js_string Js.t Js.prop
  (** {% <p>An optional extra CSS class that will be added to the container. This can be useful for
adding customized styles to the container or any of its children using standard CSS
rules. See <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.<a href="#!/api/Ext.Component-cfg-componentCls" rel="Ext.Component-cfg-componentCls" class="docClass">componentCls</a> also.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_util_ElementContainer.events
  inherit Ext_layout_Layout.events
  
  
end

class type statics =
object
  inherit Ext_layout_Layout.statics
  inherit Ext_util_ElementContainer.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

