(** A specialized floating Component that supports a d ...
  
  {% <p>A specialized floating Component that supports a drop status icon, <a href="#!/api/Ext.Layer" rel="Ext.Layer" class="docClass">Ext.Layer</a> styles
and auto-repair.  This is the default drag proxy used by all Ext.dd components.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method getGhost : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the ghost element</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>el</p> %}
    }
    }
    *)
  method hide_proxy : bool Js.t -> unit Js.meth
  (** {% <p>Hides the proxy</p> %}
    
    {b Parameters}:
    {ul {- clear: [bool Js.t]
    {% <p>True to reset the status and clear the ghost contents,
false to preserve them</p> %}
    }
    }
    *)
  method repair : Js.number Js.t Js.js_array Js.t -> _ Js.callback -> _ Js.t
    -> unit Js.meth
  (** {% <p>Causes the proxy to return to its position of origin via an animation.
Should be called after an invalid drop operation by the item being dragged.</p> %}
    
    {b Parameters}:
    {ul {- xy: [Js.number Js.t Js.js_array Js.t]
    {% <p>The XY position of the element ([x, y])</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>The function to call after the repair is complete.</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback function is executed.
Defaults to the browser window.</p> %}
    }
    }
    *)
  method reset : bool Js.t -> unit Js.meth
  (** {% <p>Resets the status indicator to the default dropNotAllowed value</p> %}
    
    {b Parameters}:
    {ul {- clearGhost: [bool Js.t]
    {% <p>True to also remove all content from the ghost, false to preserve it</p> %}
    }
    }
    *)
  method setStatus : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Updates the proxy's visual element to indicate the status of whether or not drop is allowed
over the current target element.</p> %}
    
    {b Parameters}:
    {ul {- cssClass: [Js.js_string Js.t]
    {% <p>The css class for the new drop status indicator image</p> %}
    }
    }
    *)
  method stop : unit Js.meth
  (** {% <p>Stops the repair animation if it's currently running</p> %}
    *)
  method sync : unit Js.meth
  (** {% <p>Force the Layer to sync its shadow and shim positions to the element</p> %}
    *)
  method update_html : _ Js.t -> unit Js.meth
  (** {% <p>Updates the contents of the ghost element</p> %}
    
    {b Parameters}:
    {ul {- html: [_ Js.t]
    {% <p>The html that will replace the current innerHTML of the ghost element, or a
DOM node to append as the child of the ghost element (in which case the innerHTML will be cleared first).</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method dropAllowed : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to the status element when drop is allowed.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'dd-drop-ok']
    *)
  method dropNotAllowed : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to the status element when drop is not allowed.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'dd-drop-nodrop']
    *)
  method renderTpl : _ Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.dd.StatusProxy-method-getEl" rel="Ext.dd.StatusProxy-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.dd.StatusProxy-method-getEl" rel="Ext.dd.StatusProxy-method-getEl" class="docClass">Element</a> empty. The more specialized ExtJS and Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.dd.StatusProxy-cfg-renderSelectors" rel="Ext.dd.StatusProxy-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.dd.StatusProxy-cfg-childEls" rel="Ext.dd.StatusProxy-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: [['<div class="' + Ext.baseCSSPrefix + 'dd-drop-icon"></div>' + '<div id="{id}-ghost" class="' + Ext.baseCSSPrefix + 'dd-drag-ghost"></div>']]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  
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

