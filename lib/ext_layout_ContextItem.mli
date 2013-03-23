(** This class manages state information for a compone ...
  
  {% <p>This class manages state information for a component or element during a layout.</p>

<h1>Blocks</h1>

<p>A "block" is a required value that is preventing further calculation. When a layout has
encountered a situation where it cannot possibly calculate results, it can associate
itself with the context item and missing property so that it will not be rescheduled
until that property is set.</p>

<p>Blocks are a one-shot registration. Once the property changes, the block is removed.</p>

<p>Be careful with blocks. If <em>any</em> further calculations can be made, a block is not the
right choice.</p>

<h1>Triggers</h1>

<p>Whenever any call to <a href="#!/api/Ext.layout.ContextItem-method-getProp" rel="Ext.layout.ContextItem-method-getProp" class="docClass">getProp</a>, <a href="#!/api/Ext.layout.ContextItem-method-getDomProp" rel="Ext.layout.ContextItem-method-getDomProp" class="docClass">getDomProp</a>, <a href="#!/api/Ext.layout.ContextItem-method-hasProp" rel="Ext.layout.ContextItem-method-hasProp" class="docClass">hasProp</a> or
<a href="#!/api/Ext.layout.ContextItem-method-hasDomProp" rel="Ext.layout.ContextItem-method-hasDomProp" class="docClass">hasDomProp</a> is made, the current layout is automatically registered as being
dependent on that property in the appropriate state. Any changes to the property will
trigger the layout and it will be queued in the <a href="#!/api/Ext.layout.Context" rel="Ext.layout.Context" class="docClass">Ext.layout.Context</a>.</p>

<p>Triggers, once added, remain for the entire layout. Any changes to the property will
reschedule all unfinished layouts in their trigger set.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method addCls : _ Js.t -> unit Js.meth
  (** {% <p>Queue the addition of a class name (or array of class names) to this ContextItem's target when next flushed.</p> %}
    
    {b Parameters}:
    {ul {- newCls: [_ Js.t]
    }
    }
    *)
  method block : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Registers a layout in the block list for the given property. Once the property is
set in the <a href="#!/api/Ext.layout.Context" rel="Ext.layout.Context" class="docClass">Ext.layout.Context</a>, the layout is unblocked.</p> %}
    
    {b Parameters}:
    {ul {- layout: [Ext_layout_Layout.t Js.t]
    }
    {- propName: [Js.js_string Js.t]
    {% <p>The property name that blocked the layout (e.g., 'width').</p> %}
    }
    }
    *)
  method clearMarginCache : unit Js.meth
  (** {% <p>clears the margin cache so that marginInfo get re-read from the dom on the next call to getMarginInfo()
This is needed in some special cases where the margins have changed since the last layout, making the cached
values invalid.  For example collapsed window headers have different margin than expanded ones.</p> %}
    *)
  method domBlock : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Registers a layout in the DOM block list for the given property. Once the property
flushed to the DOM by the <a href="#!/api/Ext.layout.Context" rel="Ext.layout.Context" class="docClass">Ext.layout.Context</a>, the layout is unblocked.</p> %}
    
    {b Parameters}:
    {ul {- layout: [Ext_layout_Layout.t Js.t]
    }
    {- propName: [Js.js_string Js.t]
    {% <p>The property name that blocked the layout (e.g., 'width').</p> %}
    }
    }
    *)
  method flush : unit Js.meth
  (** {% <p>Flushes any updates in the dirty collection to the DOM. This is only called if there
are dirty entries because this object is only added to the flushQueue of the
<a href="#!/api/Ext.layout.Context" rel="Ext.layout.Context" class="docClass">Ext.layout.Context</a> when entries become dirty.</p> %}
    *)
  method getBorderInfo : _ Js.t Js.meth
  (** {% <p>Gets the border information for the element as an object with left, top, right and
bottom properties holding border size in pixels. This object is only read from the
DOM on first request and is cached.</p> %}
    *)
  method getClassList : unit Js.meth
  (** {% <p>Returns a ClassList-like object to buffer access to this item's element's classes.</p> %}
    *)
  method getDomProp : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Gets a property of this object if it is correct in the DOM. Also tracks the current
layout as dependent on this property so that DOM writes of it will trigger the
layout to be recalculated.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The property name (e.g., 'width').</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The property value or undefined if not yet set or is dirty.</p> %}
    }
    }
    *)
  method getEl : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Returns the context item for an owned element. This should only be called on a
component's item. The list of child items is used to manage invalidating calculated
results.</p>

<p><strong>Overridden in Ext.diag.layout.ContextItem.</strong></p> %}
    
    {b Parameters}:
    {ul {- nameOrEl: [_ Js.t]
    {% <p>The element or the name of an owned element</p> %}
    }
    {- owner: [_ Js.t] (optional)
    {% <p>The owner of the
named element if the passed "nameOrEl" parameter is a String. Defaults to this
ContextItem's "target" property.  For more details on owned elements see
<a href="#!/api/Ext.Component-cfg-childEls" rel="Ext.Component-cfg-childEls" class="docClass">childEls</a> and
<a href="#!/api/Ext.Component-cfg-renderSelectors" rel="Ext.Component-cfg-renderSelectors" class="docClass">renderSelectors</a></p> %}
    }
    }
    *)
  method getFrameInfo : _ Js.t Js.meth
  (** {% <p>Gets the "frame" information for the element as an object with left, top, right and
bottom properties holding border+framing size in pixels. This object is calculated
on first request and is cached.</p> %}
    *)
  method getMarginInfo : _ Js.t Js.meth
  (** {% <p>Gets the margin information for the element as an object with left, top, right and
bottom properties holding margin size in pixels. This object is only read from the
DOM on first request and is cached.</p> %}
    *)
  method getPaddingInfo : _ Js.t Js.meth
  (** {% <p>Gets the padding information for the element as an object with left, top, right and
bottom properties holding padding size in pixels. This object is only read from the
DOM on first request and is cached.</p> %}
    *)
  method getProp : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Gets a property of this object. Also tracks the current layout as dependent on this
property so that changes to it will trigger the layout to be recalculated.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The property name that blocked the layout (e.g., 'width').</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The property value or undefined if not yet set.</p> %}
    }
    }
    *)
  method getStyle : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Returns a style for this item. Each style is read from the DOM only once on first
request and is then cached. If the value is an integer, it is parsed automatically
(so '5px' is not returned, but rather 5).</p> %}
    
    {b Parameters}:
    {ul {- styleName: [Js.js_string Js.t]
    {% <p>The CSS style name.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The value of the DOM style (parsed as necessary).</p> %}
    }
    }
    *)
  method getStyles : Js.js_string Js.t Js.js_array Js.t ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Returns styles for this item. Each style is read from the DOM only once on first
request and is then cached. If the value is an integer, it is parsed automatically
(so '5px' is not returned, but rather 5).</p> %}
    
    {b Parameters}:
    {ul {- styleNames: [Js.js_string Js.t Js.js_array Js.t]
    {% <p>The CSS style names.</p> %}
    }
    {- altNames: [Js.js_string Js.t Js.js_array Js.t] (optional)
    {% <p>The alternate names for the returned styles. If given,
these names must correspond one-for-one to the <code>styleNames</code>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The values of the DOM styles (parsed as necessary).</p> %}
    }
    }
    *)
  method hasDomProp : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the given property is correct in the DOM. This is equivalent to
calling <a href="#!/api/Ext.layout.ContextItem-method-getDomProp" rel="Ext.layout.ContextItem-method-getDomProp" class="docClass">getDomProp</a> and not getting an undefined result. In particular,
this call registers the current layout to be triggered by flushes of this property.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The property name (e.g., 'width').</p> %}
    }
    }
    *)
  method hasProp : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the given property has been set. This is equivalent to calling
<a href="#!/api/Ext.layout.ContextItem-method-getProp" rel="Ext.layout.ContextItem-method-getProp" class="docClass">getProp</a> and not getting an undefined result. In particular, this call
registers the current layout to be triggered by changes to this property.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The property name (e.g., 'width').</p> %}
    }
    }
    *)
  method invalidate : _ Js.t -> unit Js.meth
  (** {% <p>Invalidates the component associated with this item. The layouts for this component
and all of its contained items will be re-run after first clearing any computed
values.</p>

<p>If state needs to be carried forward beyond the invalidation, the <code>options</code> parameter
can be used.</p>

<p><strong>Overridden in Ext.diag.layout.ContextItem.</strong></p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>An object describing how to handle the invalidation.</p> %}
    }
    }
    *)
  method recoverProp : Js.js_string Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Recovers a property value from the last computation and restores its value and
dirty state.</p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The name of the property to recover.</p> %}
    }
    {- oldProps: [_ Js.t]
    {% <p>The old "props" object from which to recover values.</p> %}
    }
    {- oldDirty: [_ Js.t]
    {% <p>The old "dirty" object from which to recover state.</p> %}
    }
    }
    *)
  method removeCls : _ Js.t -> unit Js.meth
  (** {% <p>Queue the removal of a class name (or array of class names) from this ContextItem's target when next flushed.</p> %}
    
    {b Parameters}:
    {ul {- removeCls: [_ Js.t]
    }
    }
    *)
  method removeEl : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Removes a cached ContextItem that was created using <a href="#!/api/Ext.layout.ContextItem-method-getEl" rel="Ext.layout.ContextItem-method-getEl" class="docClass">getEl</a>.  It may be
necessary to call this method if the dom reference for owned element changes so
that <a href="#!/api/Ext.layout.ContextItem-method-getEl" rel="Ext.layout.ContextItem-method-getEl" class="docClass">getEl</a> can be called again to reinitialize the ContextItem with the
new element.</p> %}
    
    {b Parameters}:
    {ul {- nameOrEl: [_ Js.t]
    {% <p>The element or the name of an owned element</p> %}
    }
    {- owner: [_ Js.t] (optional)
    {% <p>The owner of the
named element if the passed "nameOrEl" parameter is a String. Defaults to this
ContextItem's "target" property.</p> %}
    }
    }
    *)
  method setAttribute : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Queue the setting of a DOM attribute on this ContextItem's target when next flushed.</p> %}
    
    {b Parameters}:
    {ul {- name: [_ Js.t]
    }
    {- value: [_ Js.t]
    }
    }
    *)
  method setContentHeight : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets the contentHeight property. If the component uses raw content, then only the
measured height is acceptable.</p>

<p>Calculated values can sometimes be NaN or undefined, which generally mean the
calculation is not done. To indicate that such as value was passed, 0 is returned.
Otherwise, 1 is returned.</p>

<p>If the caller is not measuring (i.e., they are calculating) and the component has raw
content, 1 is returned indicating that the caller is done.</p> %}
    
    {b Parameters}:
    {ul {- height: [_ Js.t]
    }
    {- measured: [_ Js.t]
    }
    }
    *)
  method setContentSize : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets the contentWidth and contentHeight properties. If the component uses raw content,
then only the measured values are acceptable.</p>

<p>Calculated values can sometimes be NaN or undefined, which generally means that the
calculation is not done. To indicate that either passed value was such a value, false
returned. Otherwise, true is returned.</p>

<p>If the caller is not measuring (i.e., they are calculating) and the component has raw
content, true is returned indicating that the caller is done.</p> %}
    
    {b Parameters}:
    {ul {- width: [_ Js.t]
    }
    {- height: [_ Js.t]
    }
    {- measured: [_ Js.t]
    }
    }
    *)
  method setContentWidth : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets the contentWidth property. If the component uses raw content, then only the
measured width is acceptable.</p>

<p>Calculated values can sometimes be NaN or undefined, which generally means that the
calculation is not done. To indicate that such as value was passed, 0 is returned.
Otherwise, 1 is returned.</p>

<p>If the caller is not measuring (i.e., they are calculating) and the component has raw
content, 1 is returned indicating that the caller is done.</p> %}
    
    {b Parameters}:
    {ul {- width: [_ Js.t]
    }
    {- measured: [_ Js.t]
    }
    }
    *)
  method setHeight : Js.number Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  (** {% <p>Sets the height and constrains the height to min/maxHeight range.</p>

<p><strong>Overridden in Ext.diag.layout.ContextItem.</strong></p> %}
    
    {b Parameters}:
    {ul {- height: [Js.number Js.t]
    {% <p>The height.</p> %}
    }
    {- dirty: [bool Js.t] (optional)
    {% <p>Specifies if the value is currently in the DOM. A
value of <code>false</code> indicates that the value is already in the DOM.</p> %}
     Defaults to: true
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The actual height after constraining.</p> %}
    }
    }
    *)
  method setProp : Js.js_string Js.t -> _ Js.t -> bool Js.t -> Js.number Js.t
    Js.meth
  (** {% <p>Sets a property value. This will unblock and/or trigger dependent layouts if the
property value is being changed. Values of NaN and undefined are not accepted by
this method.</p>

<p><strong>Overridden in Ext.diag.layout.ContextItem.</strong></p> %}
    
    {b Parameters}:
    {ul {- propName: [Js.js_string Js.t]
    {% <p>The property name (e.g., 'width').</p> %}
    }
    {- value: [_ Js.t]
    {% <p>The new value of the property.</p> %}
    }
    {- dirty: [bool Js.t]
    {% <p>Optionally specifies if the value is currently in the DOM
 (default is <code>true</code> which indicates the value is not in the DOM and must be flushed
 at some point).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>1 if this call specified the property value, 0 if not.</p> %}
    }
    }
    *)
  method setWidth : Js.number Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  (** {% <p>Sets the height and constrains the width to min/maxWidth range.</p>

<p><strong>Overridden in Ext.diag.layout.ContextItem.</strong></p> %}
    
    {b Parameters}:
    {ul {- width: [Js.number Js.t]
    {% <p>The width.</p> %}
    }
    {- dirty: [bool Js.t] (optional)
    {% <p>Specifies if the value is currently in the DOM. A
value of <code>false</code> indicates that the value is already in the DOM.</p> %}
     Defaults to: true
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The actual width after constraining.</p> %}
    }
    }
    *)
  method state : _ Js.t Js.prop
  (** {% <p>State variables that are cleared when invalidated. Only applies to component items.</p> %}
    *)
  method wrapsComponent : bool Js.t Js.readonly_prop
  (** {% <p>True if this item wraps a Component (rather than an Element).</p> %}
    
    Defaults to: [false]
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

